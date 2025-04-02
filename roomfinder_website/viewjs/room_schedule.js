import RoomScheduleViewModel from '../viewmodel/roomscheduleViewModel.js';
import RoomViewModel from '../viewmodel/roomViewModel.js';
import { showToast } from '../viewjs/toast.js';
import { dateTimeFormat } from '../viewjs/timeformat.js';
import { changeTitle } from './dashboard.js';

export async function InitRoomScheduleSection() {
    const scheduleSection = document.getElementById('room_schedule');
    const scheduleBody = scheduleSection.querySelector('.table-data');
    const floatingBtn = document.querySelector('.create-new-sched-btn'); 

    changeTitle('Room Schedules');

    // Fetch all room schedules
    const result = await RoomScheduleViewModel.getAllRoomSchedules();

    if (result.success) {
        scheduleBody.innerHTML = '';

        if (result.schedules.length > 0) {
            // If there are schedules, display them
            result.schedules.forEach(schedule => {
                const row = document.createElement('tr');

                const formattedStartTime = dateTimeFormat(schedule.starting_time);
                const formattedEndTime = dateTimeFormat(schedule.ending_time);

                row.innerHTML = `
                    <td>${schedule.room_building || 'N/A'}</td>
                    <td>${schedule.room_number || 'N/A'}</td>
                    <td>${schedule.date ? schedule.date + '<br/>' + formattedStartTime + ' - ' + formattedEndTime : 'N/A'}</td>
                    <td>${schedule.block || 'N/A'}</td>
                    <td>
                        <button class="update-btn-sched" data-schedule-id="${schedule.id}">Update</button>
                        <button class="delete-btn-sched" data-schedule-id="${schedule.id}">Delete</button>
                    </td>
                `;

                scheduleBody.appendChild(row);
            });
        } else {
            // If no schedules are available, show a message row
            const noScheduleRow = document.createElement('tr');
            noScheduleRow.innerHTML = `
                <td colspan="5" style="text-align: center;">No schedule available</td>
            `;
            scheduleBody.appendChild(noScheduleRow);
        }
    } else {
        showToast(result.message, 'error');
    }


    // Event listener for "Create New Schedule" button
    floatingBtn.addEventListener('click', () => {
        showCreateScheduleModal();
    });

    // Event listener for "Update" button
    document.addEventListener('click', async (event) => {
        if (event.target.classList.contains('update-btn-sched')) {
            const scheduleId = event.target.getAttribute('data-schedule-id');
            await showScheduleInModal(scheduleId); 
        }

        // Event listener for "Close" button in modal
        if (event.target.classList.contains('closemodal') || event.target.classList.contains('closeModalBtn')) {
            const modal = document.getElementById('viewUpdateModal');
            modal.style.display = 'none'; 
        }

        // Event listener for "Delete" button in schedule table
        if (event.target.classList.contains('delete-btn-sched')) {
            const scheduleId = event.target.getAttribute('data-schedule-id');
            await deleteRoomSchedule(scheduleId, event.target);
        }
    });

    document.addEventListener('click', function (event) {
        if (event.target.classList.contains('closemodal') || event.target.classList.contains('closeModalBtn')) {
            const modal = document.getElementById('modal'); 
            modal.style.display = 'none';
        }
    });

    // Function to handle viewing and updating an existing schedule
    async function showScheduleInModal(scheduleId) {
        const result = await RoomScheduleViewModel.getRoomScheduleById(scheduleId);
        
        if (result.success) {
            const schedule = result.schedule;


            const modal = document.getElementById('viewUpdateModal');
            if (!modal) {
                console.error('Modal element not found!');
                return;
            }
            modal.style.display = 'flex'; 

            const form = modal.querySelector('form');
            
            // Populate the room building and room number based on the existing schedule data
            form.querySelector('#viewRoomBldg').value = schedule.room_building || ''; 
            form.querySelector('#viewRoomNumber').value = schedule.room_number || ''; 

            form.querySelector('#viewBlock').value = schedule.block || '';
            form.querySelector('#viewDate').value = schedule.date || '';
            form.querySelector('#viewTimeStart').value = formatTimeWithoutSeconds(schedule.starting_time);
            form.querySelector('#viewTimeEnd').value = formatTimeWithoutSeconds(schedule.ending_time);

            // Modify the submit button to perform update
            const actionButton = form.querySelector('.action-btn');
            actionButton.textContent = "Update Schedule";

            // Submit logic for updating the schedule
            form.onsubmit = async (event) => {
                event.preventDefault();

                const updatedScheduleData = {
                    block: form.querySelector('#viewBlock').value,
                    date: form.querySelector('#viewDate').value,
                    starting_time: form.querySelector('#viewTimeStart').value,
                    ending_time: form.querySelector('#viewTimeEnd').value,
                    room_building: form.querySelector('#viewRoomBldg').value,
                    room_number: form.querySelector('#viewRoomNumber').value
                };

                const updateResult = await RoomScheduleViewModel.updateRoomSchedule(schedule.id, updatedScheduleData);

                if (updateResult.success) {
                    showToast(updateResult.message, 'success');
                    modal.style.display = 'none'; 
                    InitRoomScheduleSection(); 
                } else {
                    showToast(updateResult.message, 'error');
                }
            };

        } else {
            showToast(result.message, 'error');
        }
    }

    async function showCreateScheduleModal() {
        const modal = document.getElementById('modal');
        modal.style.display = 'flex'; 
    
        const form = modal.querySelector('form');
        form.reset();
        form.querySelector('#roomBldg').disabled = false; 
        form.querySelector('#roomNumber').disabled = false;
        form.querySelector('.action-btn').textContent = "Create"; 
        
        // Fetch all rooms to populate the room building and room number options
        const roomResult = await RoomViewModel.getAllRooms();
        
        if (roomResult.success) {
            const roomBldgSelect = form.querySelector('#roomBldg');
            const roomNumberSelect = form.querySelector('#roomNumber');
            
            // Clear previous room options
            roomBldgSelect.innerHTML = `<option value="">Select Room Building</option>`;
            roomNumberSelect.innerHTML = `<option value="">Select Room Number</option>`;
        
            // Populate room buildings with room ID as value
            const buildings = [];
            roomResult.rooms.forEach(room => {
                if (!buildings.includes(room.room_building)) {
                    buildings.push(room.room_building);
                    const roomBldgOption = document.createElement('option');
                    roomBldgOption.value = room.room_building; 
                    roomBldgOption.textContent = room.room_building; 
                    roomBldgSelect.appendChild(roomBldgOption);
                }
            });
    
            roomBldgSelect.addEventListener('change', function() {
                const selectedBuilding = roomBldgSelect.value;
                const filteredRooms = roomResult.rooms.filter(room => room.room_building === selectedBuilding);
                
                // Clear the room number dropdown
                roomNumberSelect.innerHTML = `<option value="">Select Room Number</option>`;
               
                filteredRooms.forEach(room => {
                    const roomNumberOption = document.createElement('option');
                    roomNumberOption.value = room.id;  
                    roomNumberOption.textContent = `${room.room_number}`;  
                    roomNumberSelect.appendChild(roomNumberOption);
                });
            });
        
            if (form.querySelector('#roomBldg').value) {
                roomBldgSelect.dispatchEvent(new Event('change')); 
            }
        } else {
            showToast(roomResult.message, 'error');
        }
    
        // Handle the form submission for creating the schedule
        form.onsubmit = async (event) => {
            event.preventDefault();  
    
            // Collect data from the form
            const scheduleData = {
                block: form.querySelector('#block').value,
                date: form.querySelector('#date').value,
                starting_time: form.querySelector('#timeStart').value,
                ending_time: form.querySelector('#timeEnd').value,
                room_id: form.querySelector('#roomNumber').value 
            };
    
            // Call the createRoomSchedule method from the RoomScheduleViewModel
            const response = await RoomScheduleViewModel.createRoomSchedule(scheduleData);
            
            if (response.success) {
                showToast(response.message, 'success');
                modal.style.display = 'none'; 
                InitRoomScheduleSection();     
            } else {
                showToast(response.message, 'error');
            }
        };
    }
    
    

    // Function to delete room schedule
    async function deleteRoomSchedule(scheduleId, buttonElement) {
        // Show confirmation toast instead of the confirm dialog
        showToast('Are you sure you want to delete this schedule?', 'info', {
            showButtons: true,
            onConfirm: async () => {
                try {
                    const result = await RoomScheduleViewModel.deleteRoomSchedule(scheduleId);
                    if (result.success) {
                        // Remove the row from the table if deletion is successful
                        const row = buttonElement.closest('tr');
                        row.remove();
                        showToast(result.message, 'success');
                    } else {
                        showToast(result.message || 'Failed to delete schedule', 'error');
                    }
                } catch (error) {
                    console.error('Error deleting schedule:', error);
                    showToast('Error deleting schedule', 'error');
                }
            },
            onCancel: () => {
                showToast('Schedule deletion canceled', 'info'); 
            }
        });
    }

    // Modal time format helper
    function formatTimeWithoutSeconds(time) {
        const [hours, minutes] = time.split(':');
        return `${hours}:${minutes}`;
    }

    function searchTable() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase(); 
        const rows = scheduleBody.querySelectorAll('tr'); 
    
        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            let matchFound = false;
    
            cells.forEach(cell => {
                if (cell.textContent.toLowerCase().includes(filter)) {
                    matchFound = true; 
                }
            });
    
            if (matchFound) {
                row.style.display = ''; 
            } else {
                row.style.display = 'none'; 
            }
        });
    }

    
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('input', searchTable);
    }
    
}
