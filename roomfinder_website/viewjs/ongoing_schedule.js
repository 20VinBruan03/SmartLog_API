import RoomScheduleViewModel from '../viewmodel/roomscheduleViewModel.js';
import { showToast } from '../viewjs/toast.js';
import { dateTimeFormat } from '../viewjs/timeformat.js';
import { changeTitle } from './dashboard.js';

export function InitOngoingScheduleSection() {
    const ongoingScheduleSection = document.getElementById('ongoing_schedule');
    const ongoingScheduleBody = ongoingScheduleSection.querySelector('.table-data');

    changeTitle('Ongoing Schedules');
    async function init() {
        await loadOngoingSchedules();
    }

    // get ongoing schedules
    async function loadOngoingSchedules() {
        try {
            const result = await RoomScheduleViewModel.getOngoingSchedules();
            if (result.success) {
                const ongoingSchedules = result.ongoingSchedules;
                if (ongoingSchedules.length > 0) {
                    renderOngoingSchedules(ongoingSchedules);
                } else {
                    ongoingScheduleBody.innerHTML = `<tr><td colspan="5">No ongoing schedules available</td></tr>`;
                }
            } else {
                ongoingScheduleBody.innerHTML = `<tr><td colspan="5">Error: ${result.message}</td></tr>`;
            }
        } catch (error) {
            console.error('Error loading ongoing schedules:', error);
            ongoingScheduleBody.innerHTML = `<tr><td colspan="5">Failed to load ongoing schedules.</td></tr>`;
        }
    }

    // render ongoing schedules list
    function renderOngoingSchedules(ongoingSchedules) {
        ongoingScheduleBody.innerHTML = ''; 

        ongoingSchedules.forEach(schedule => {
            const row = OngoingScheduleRow(schedule);
            ongoingScheduleBody.appendChild(row);
        });
    }

    // Ongoing schedule row
    function OngoingScheduleRow(schedule) {
        const row = document.createElement('tr');
        row.classList.add('ongoing-schedule-item');

        const startTime = dateTimeFormat(schedule.starting_time);
        const endTime = dateTimeFormat(schedule.ending_time);

        row.innerHTML = `
        <td>${schedule.room_building || 'N/A'}</td>
        <td>${schedule.room_number || 'N/A'}</td>
        <td>${schedule.date + '<br/>' + startTime  + ' - ' + endTime  || 'N/A'}</td>
        <td>${schedule.block || 'N/A'}</td>
        <td>
            <button class="delete-btn" data-id="${schedule.id}">Delete</button>
        </td>
    `;

        // dlete event listener
        row.querySelector('.delete-btn').addEventListener('click', () => handleDelete(schedule, row));

        return row;
    }

    // delete ongoing schedule
    function handleDelete(schedule, row) {
        showToast('Are you sure you want to delete this schedule?', 'info', {
            showButtons: true,
            onConfirm: async () => {
                try {
                    const response = await RoomScheduleViewModel.deleteRoomSchedule(schedule.id);
                    if (response.success) {
                        showToast(response.message, 'success');
                        row.remove();
                    } else {
                        showToast(response.message, 'error');
                    }
                } catch (error) {
                    console.error('Error deleting schedule:', error);
                    showToast('Failed to delete room schedule', 'error');
                }
            },
            onCancel: () => console.log('Schedule deletion canceled')
        });
    }

    // search text
    function searchTable() {
        const input = document.getElementById("searchInput");
        const filter = input.value.toUpperCase();
        const rows = ongoingScheduleBody.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName("td");
            let match = false;

            for (let j = 0; j < cells.length; j++) {
                const cell = cells[j];
                if (cell) {
                    const textValue = cell.textContent || cell.innerText;
                    if (textValue.toUpperCase().indexOf(filter) > -1) {
                        match = true;
                    }
                }
            }

            if (match) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }

    // search event
    document.getElementById("searchInput").addEventListener("keyup", searchTable);

    init();
}
