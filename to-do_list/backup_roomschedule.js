import RoomViewModel from '../viewmodel/roomViewModel.js'; 
import RoomScheduleViewModel from '../viewmodel/roomscheduleViewModel.js';
import { showToast } from '../viewjs/toast.js';
import { dateTimeFormat } from '../viewjs/timeformat.js';
import { changeTitle } from './dashboard.js';

export function InitRoomScheduleSection() {
    const scheduleSection = document.getElementById('room_schedule');
    const scheduleBody = scheduleSection.querySelector('.table-data');
    const addModal = document.getElementById('modal');
    const floatingBtn = document.querySelector('.floating-btn');
    // const addCloseBtn = document.querySelector('#modal .closemodal');
    const addRoomScheduleForm = document.querySelector('.roomdetails_form');
    const closeModalBtn = addModal.querySelector('.closeModalBtn');

    changeTitle('Room Schedules');
    // const roomNumberSelect = addModal.querySelector('#roomNumber');
    // const roomBuildingSelect = addModal.querySelector('#roomBldg');

    let selectedRoomId = null;
    let rooms = [];  


    // Initialize events
    function initEventListeners() {
        floatingBtn.addEventListener('click', openAddRoomScheduleModal);
        window.addEventListener('click', closeModalOnClickOutside);
        addRoomScheduleForm.addEventListener('submit', handleAddRoomSchedule);
        closeModalBtn.addEventListener('click', closeAddRoomScheduleModal);
    }

    // modal only
    function openAddRoomScheduleModal() {
        addModal.style.display = 'block';

        addModal.setAttribute('data-room-id', selectedRoomId);
        setRoomFieldsReadOnly(false);
    
        // Reset button text to "Create" when opening for a new schedule
        const actionButton = addModal.querySelector('.action-btn');
        actionButton.textContent = 'Create';  

        if (actionButton.textContent === 'Create') {
            fetchRooms();  // Fetch rooms only for creating a new schedule
        }
    }
    
    function closeAddRoomScheduleModal() {
        addModal.style.display = 'none';
        addRoomScheduleForm .reset();
    }
    function closeModalOnClickOutside(event) {
        if (event.target === addModal) {
            closeAddRoomScheduleModal();
        }
    }

    // fetch and render schedule
    async function fetchSchedules() {
        scheduleBody.innerHTML = ''; 
        try {
            const response = await RoomScheduleViewModel.getAllRoomSchedules();
            if (response.success && response.schedules.length > 0) {
                renderSchedules(response.schedules);
                console.log(response.schedules);
            } else {
                showNoSchedulesMessage(response.message || 'No room schedules available');
            }
        } catch (error) {
            console.error('Error loading room schedules:', error);
            showNoSchedulesMessage('Failed to load room schedules.');
        }
    }

    // render rows
    function renderSchedules(schedules) {
        console.log('Rendering schedules:', schedules);
        schedules.forEach(schedule => {
            const row = createScheduleRow(schedule);
            scheduleBody.appendChild(row);
        });
    }

    // create schedule row
    function createScheduleRow(schedule) {
        const row = document.createElement('tr');
        row.classList.add('room-schedule-item');

        console.log(schedule);
        const startTime = dateTimeFormat(schedule.starting_time);
        const endTime = dateTimeFormat(schedule.ending_time);

        row.innerHTML = `
            <td>${schedule.room_building || 'N/A'}</td>
            <td>${schedule.room_number || 'N/A'}</td>
            <td>${schedule.date + '<br/>' + startTime + ' - ' + endTime || 'N/A'}</td>
            <td>${schedule.block || 'N/A'}</td>
            <td>
                <button class="update-btn-sched" data-id="${schedule.id}">Update</button>
                <button class="delete-btn-sched" data-id="${schedule.id}">Delete</button>
            </td>
        `
        console.log(schedule.room_number);
        ;

        // button event listeners
        row.querySelector('.update-btn-sched').addEventListener('click', () => { 
            console.log(`Attempting to update schedule with ID: ${schedule.id}`); 
            handleUpdate(schedule.id)
        });
        row.querySelector('.delete-btn-sched').addEventListener('click', () => {
            console.log(`Attempting to delete schedule with ID: ${schedule.id}`); 
            handleDelete(schedule, row)});
        row.querySelector('.update-btn').addEventListener('click', () =>handleUpdate(schedule.id));
        row.querySelector('.delete-btn-sched').addEventListener('click', () => {
            console.log(`Attempting to delete schedule with ID: ${schedule.id}`);
            handleDelete(schedule, row);
        });
        

        return row;
    }

    function showNoSchedulesMessage(message) {
        scheduleBody.innerHTML = `<tr><td colspan="6">${message}</td></tr>`;
    }

    // handle delete schedule
    function handleDelete(schedule, row) {
        showToast('Are you sure you want to delete this schedule?', 'info', {
            showButtons: true,
            onConfirm: async () => {
                try {
                    // Call the delete method from RoomScheduleViewModel
                    const response = await RoomScheduleViewModel.deleteRoomSchedule(schedule.id);
                    if (response.success) {
                        // Show success message
                        showToast(response.message, 'success');
                        // Remove the schedule row from the table
                        row.remove();
                    } else {
                        // Show error message if deletion failed
                        showToast(response.message, 'error');
                    }
                } catch (error) {
                    // Handle any error during the deletion process
                    console.error('Error deleting schedule:', error);
                    showToast('Failed to delete room schedule', 'error');
                }
            },
            onCancel: () => {
                console.log('Schedule deletion canceled');
            }
        });
    }

    // handle add room schedule
    async function handleAddRoomSchedule(event) {
        event.preventDefault();

        const scheduleData = getRoomFormData();
        const actionButton = addModal.querySelector('.action-btn');

        // check if bldg and number is set
        const roomBuildingSelect = addModal.querySelector('#roomBldg');
        const roomNumberSelect = addModal.querySelector('#roomNumber');
        
        if (roomBuildingSelect.value === "" || roomNumberSelect.value === "") {
            showToast('Please select both a building and a room number', 'error');
            return;  
        }

        try {
            // create schedule
            if (actionButton.textContent === 'Create') {
                const response = await RoomScheduleViewModel.createRoomSchedule(scheduleData);
                if (response.success) {
                    fetchSchedules();
                    closeAddRoomScheduleModal();
                } else {
                    showToast('Failed to create room schedule', 'error');
                }
            }
            // update schedule 
             if (actionButton.textContent === 'Update') {
                const scheduleId = addModal.getAttribute('data-schedule-id'); 
                const response = await RoomScheduleViewModel.updateRoomSchedule(scheduleId, scheduleData);
                if (response.success) {
                    fetchSchedules();
                    closeAddRoomScheduleModal();
                } if (response.status === 'error') {
                    showToast(response.message, 'error'); 
                    return; 
                }
            }
        } catch (error) {
            console.error('Error saving room schedule:', error);
        }
    }

    // view & update schedule
    async function handleUpdate(scheduleId) {

        const response = await RoomScheduleViewModel.getRoomScheduleById(scheduleId);
        console.log(response.schedule);
        
        if (response.success) {
            console.log(`Viewing schedule with ID: ${scheduleId}`);
            populateScheduleForm(response.schedule);
            addModal.style.display = 'block';

            const actionButton = addModal.querySelector('.action-btn');
            actionButton.textContent = 'Update'; 
            populateRoomDropdowns(rooms, false);
        } else {
            showToast(response.message + 'Error fetching schedule', 'error');
        }
    }

    // room schedule modal form data
    function getRoomFormData() {
        const block = document.querySelector('select[name="block"]').value;
        const date = document.querySelector('input[name="date"]').value;
        const startingTime = document.querySelector('input[name="timeStart"]').value;
        const endingTime = document.querySelector('input[name="timeEnd"]').value;
        const roomId = document.getElementById('modal').getAttribute('data-room-id');
        
        return {
            room_id: roomId, 
            block: block,
            date: date,
            starting_time: startingTime,
            ending_time: endingTime
        };
    }
    
    // fetch rooms
    async function fetchRooms() {
        try {
            const response = await RoomViewModel.getAllRooms();
            if (response.success && response.rooms.length > 0) {
                rooms = response.rooms;  
                console.log('Fetched rooms:', rooms); 
                populateRoomDropdowns(rooms, true); 
            } else {
                showToast('No rooms available', 'error');
            }
        } catch (error) {
            console.error('Error fetching rooms:', error);
            showToast('Error fetching rooms', 'error');
        }
    }

    // populate the form fields with the schedule data
    function populateScheduleForm(schedule) {
        const blockSelect = addModal.querySelector('select[name="block"]');
        const dateInput = addModal.querySelector('input[name="date"]');
        const startingTimeInput = addModal.querySelector('input[name="timeStart"]');
        const endingTimeInput = addModal.querySelector('input[name="timeEnd"]');
        const roomBuildingSelect = addModal.querySelector('#roomBldg');
        const roomNumberSelect = addModal.querySelector('#roomNumber');

        addModal.setAttribute('data-schedule-id', schedule.id); 
        
        blockSelect.value = schedule.block || '';
        dateInput.value = schedule.date || '';
        startingTimeInput.value = formatTime(schedule.starting_time || '');
        endingTimeInput.value = formatTime(schedule.ending_time || '');

        populateRoomDropdowns(rooms);

        roomBuildingSelect.value = schedule.room_building || '';
        roomNumberSelect.value = schedule.room_number || ''; 

        roomBuildingSelect.dispatchEvent(new Event('change')); 

        setRoomFieldsReadOnly(true);
    }
    // hh:mm format
    function formatTime(time) {
        if (!time) return '';  
        const timeParts = time.split(':'); 
        return timeParts.length >= 2 ? `${timeParts[0]}:${timeParts[1]}` : time;  
    }

    // Populate the room building and room number dropdowns
    function populateRoomDropdowns(rooms, shouldPopulate = true) {
        const roomBuildingSelect = addModal.querySelector('#roomBldg');
        const roomNumberSelect = addModal.querySelector('#roomNumber');

        // Clear current options first
        roomBuildingSelect.innerHTML = '';
        roomNumberSelect.innerHTML = '';

        if (shouldPopulate) {
            // building value
            const defaultBuildingOption = document.createElement('option');
            defaultBuildingOption.value = '';
            defaultBuildingOption.textContent = 'Select a building';
            roomBuildingSelect.appendChild(defaultBuildingOption);

            // Populate room buildings
            const buildings = [...new Set(rooms.map(room => room.room_building))];
            buildings.forEach(building => {
                const option = document.createElement('option');
                option.value = building;
                option.textContent = building;
                roomBuildingSelect.appendChild(option);
            });

            // room number 
            const defaultRoomOption = document.createElement('option');
            defaultRoomOption.value = '';
            defaultRoomOption.textContent = 'Select a room number';
            roomNumberSelect.appendChild(defaultRoomOption);

            // When the room building is changed, populate room numbers
            roomBuildingSelect.addEventListener('change', () => {
                const selectedBuilding = roomBuildingSelect.value;
                const roomNumbers = rooms.filter(room => room.room_building === selectedBuilding)
                                        .map(room => room.room_number);
                populateRoomNumbers(roomNumbers);
            });

            roomNumberSelect.addEventListener('change', () => {
                updateRoomId();  
            });    
            // Trigger change to populate room numbers for the first building
            roomBuildingSelect.dispatchEvent(new Event('change'));
        }
        else {
            // When updating, populate dropdowns with the current room details only
            const roomBuildingSelect = addModal.querySelector('#roomBldg');
            const roomNumberSelect = addModal.querySelector('#roomNumber');

            // Set the current room building and room number from the schedule
            roomBuildingSelect.disabled = true; // Set to readonly
            roomNumberSelect.disabled = true; // Set to readonly
        }
    }


    // Populate room numbers based on selected building
    function populateRoomNumbers(roomNumbers) {
        const roomNumberSelect = addModal.querySelector('#roomNumber');
        roomNumberSelect.innerHTML = ''; 

        // default room number
        const defaultOption = document.createElement('option');
        defaultOption.value = '';
        defaultOption.textContent = 'Select a room number';
        roomNumberSelect.appendChild(defaultOption);

        // default building
        roomNumbers.forEach(roomNumber => {
            const option = document.createElement('option');
            option.value = roomNumber;
            option.textContent = roomNumber;
            roomNumberSelect.appendChild(option);
        });
    }

    // Update room id of selected number and building
    function updateRoomId() {
        const roomBuildingSelect = addModal.querySelector('#roomBldg');
        const roomNumberSelect = addModal.querySelector('#roomNumber');
        const selectedBuilding = roomBuildingSelect.value;
        const selectedRoomNumber = roomNumberSelect.value;

        if (!selectedBuilding || !selectedRoomNumber) {
            console.log('no building and a room number');
            return;
        }

        const selectedRoom = rooms.find(room => room.room_building === selectedBuilding && room.room_number === selectedRoomNumber);

        if (selectedRoom) {
            addModal.setAttribute('data-room-id', selectedRoom.id);
            console.log(`Room ID set to: ${selectedRoom.id}`);
        } else {
            addModal.setAttribute('data-room-id', null);
            console.log('Room ID not found');
        }
    }

    // set room bldg and number to read only 
    function setRoomFieldsReadOnly(isReadOnly) {
        const roomBuildingSelect = addModal.querySelector('#roomBldg');
        const roomNumberSelect = addModal.querySelector('#roomNumber');
        
        if (isReadOnly) {
            roomBuildingSelect.disabled = true;
            roomNumberSelect.disabled = true;
        } else {
            roomBuildingSelect.disabled = false;
            roomNumberSelect.disabled = false;
        }
    }

    function init() {
        if (addModal) {
            addModal.style.display = 'none';
        }
        initEventListeners();
        fetchSchedules();
    }

    init();
}