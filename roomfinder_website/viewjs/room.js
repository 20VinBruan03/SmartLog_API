import RoomViewModel from '../viewmodel/roomViewModel.js';
import RoomScheduleViewModel from '../viewmodel/roomscheduleViewModel.js';
import { showToast } from './toast.js';
import { dateTimeFormat } from '../viewjs/timeformat.js';
import { changeTitle } from './dashboard.js';

export function InitRoomsSection() {
    const roomListBody = document.getElementById('roomListBody');
    const searchBar = document.querySelector('.search-bar');

    const modal = document.getElementById('modal');
    const roomForm = document.getElementById('roomForm');
    const roomNumberSelect = document.querySelector('#addRoomNumberSelect');
    const addRoomBldgSelect = document.querySelector('#addRoomBuildingSelect');
    const floatingBtn = document.querySelector('.floating-btn'); 
    
    const roomCreatedModal = document.getElementById('roomCreatedModal');
    const addScheduleBtn = document.getElementById('addScheduletoRoom');
    const cancelAddScheduleBtn = document.getElementById('cancelAddSchedule');
    const addScheduleModal = document.getElementById('addScheduleModal'); 

    // const title = document.querySelector('.shifting_topbar h2');
    // title.textContent = 'Room Details';

    // const menu = document.querySelector('#mobile-menu');
    // const menuLinks = document.querySelector('.navbar__menu');
    
    // menu.addEventListener('click', function () {
    //     menu.classList.toggle('is-active');
    //     menuLinks.classList.toggle('active');
    // });

    changeTitle('Room Details');


    let searchText = '';
 
    const buildingRoomsMap = {
        "PTC": ["302", "403", "404", "405", "406"],
        "ITS": ["201", "202"]
    };

    function updateRoomNumberOptions(building) {
        roomNumberSelect.innerHTML = ""; 

        if (buildingRoomsMap[building]) {
            buildingRoomsMap[building].forEach(roomNumber => {
                const option = document.createElement("option");
                option.value = roomNumber;
                option.textContent = roomNumber;
                roomNumberSelect.appendChild(option);
            });
        }
    }

    addRoomBldgSelect.addEventListener('change', () => {
        const selectedBuilding = addRoomBldgSelect.value;
        updateRoomNumberOptions(selectedBuilding);
    });

    // Event listener for building selection change
    addRoomBldgSelect.addEventListener('change', () => {
        const selectedBuilding = addRoomBldgSelect.value;
        updateRoomNumberOptions(selectedBuilding);
    });

    // Initial setup (optional) to load rooms for the default building selection
    updateRoomNumberOptions(addRoomBldgSelect.value);


    // Initialize modal functionality
    function initModal() {
        // Close modal handlers
        document.querySelector('.closemodal').addEventListener('click', closeModal);
        document.querySelector('.backbtn').addEventListener('click', closeModal);

        // Building select change handler
        addRoomBldgSelect.addEventListener('change', () => {
            updateRoomNumberOptions(addRoomBldgSelect.value);

        });

        // Initialize room numbers
        updateRoomNumberOptions(addRoomBldgSelect.value);
        roomForm.addEventListener('submit', handleRoomFormSubmit);

        addScheduleBtn.addEventListener('click', () => {
            closeRoomCreatedModal(); 
            openAddScheduleModal(addScheduleBtn.getAttribute('data-room-id'));
        });
        cancelAddScheduleBtn.addEventListener('click', closeRoomCreatedModal);
    }

    function updateRoomNumberOptions(building) {
        roomNumberSelect.innerHTML = '';
        buildingRoomsMap[building]?.forEach(roomNumber => {
            const option = document.createElement('option');
            option.value = roomNumber;
            option.textContent = roomNumber;
            roomNumberSelect.appendChild(option);
        });
    }

    function openModal(isUpdate = false) {
        modal.style.display = 'block';
        const submitButton = document.querySelector('.createbtn');
        if (isUpdate) {
            submitButton.textContent = 'Update'; 
        } else {
            submitButton.textContent = 'Create'; 
        }
    }

    function closeModal() {
        modal.style.display = 'none';
    }

     // confirmation modal
     function openRoomCreatedModal(roomId) {
        roomCreatedModal.style.display = 'block';
        addScheduleBtn.setAttribute('data-room-id', roomId); 
        console.log('Room Created Modal Opened for Room ID:', roomId); 
    }

    // close confirmation modal
    function closeRoomCreatedModal() {
        roomCreatedModal.style.display = 'none';
    }

    // add schedule modal with room id 
    function openAddScheduleModal(roomId) {
        addScheduleModal.setAttribute('data-room-id', roomId);
        addScheduleModal.style.display = 'block';
    }

    function closeAddScheduleModal() {
        addScheduleModal.style.display = 'none'; 
    }

    // Close the add schedule modal
    document.querySelector('.closeModalBtn').addEventListener('click', () => {
        addScheduleModal.style.display = 'none';
    });

    floatingBtn.addEventListener('click', () => {
        clearForm(); 
        openModal(); 
    });

    // filter by room status event
    const statusFilter = document.getElementById('custom-filter');
    statusFilter.addEventListener('change', filterRoomsByStatus);

    function filterRoomsByStatus() {
        const selectedStatus = statusFilter.value.toLowerCase();
        const rows = document.querySelectorAll('.room-item');
        
        rows.forEach(row => {
            const roomStatus = row.querySelector('td:nth-child(4)').textContent.toLowerCase();
            if (selectedStatus === 'all' || roomStatus.includes(selectedStatus)) {
                row.style.display = ''; 
            } else {
                row.style.display = 'none'; 
            }
        });
    }


    // Fetch and display rooms
    function fetchRooms() {
        roomListBody.innerHTML = '';
        RoomViewModel.getAllRooms()
            .then(result => {
                if (result.success && result.rooms.length > 0) {
                    renderRoomRows(result.rooms);
                    filterRoomsByStatus(); 
                } else {
                     roomListBody.innerHTML = `<tr><td colspan="5">No rooms available</td></tr>`;
                }
            })
            .catch(error => {
                console.error('Error loading rooms:', error);
                roomListBody.innerHTML = `<tr><td colspan="5">Error loading rooms</td></tr>`;
            });
    }

    // Render room rows
    function renderRoomRows(rooms) {
        rooms.forEach(room => {
            const row = createRoomRow(room);
            roomListBody.appendChild(row);
        });
    }

    // Create room row with buttons
    function createRoomRow(room) {
        const row = document.createElement('tr');
        row.classList.add('room-item');

        const ongoingSchedule = formatOngoingSchedule(room);

        let statusColor = room.status === 'Available' ? 'green' : 'red';
        
        var tdStatus = `<td style="color: ${statusColor};">${room.status}</td>`;

        row.innerHTML = `
            <td>${room.room_building}</td>
            <td>${room.room_number}</td>
            <td>${ongoingSchedule}</td>
            ${tdStatus}
            <td>
                <button class="update-btn" data-room-id="${room.id}">Update</button>
                <button class="remove-btn" data-room-id="${room.id}">Remove</button>
            </td>
        `;

        row.querySelector('.remove-btn').addEventListener('click', () => handleRemoveRoom(room.id, row));
        row.querySelector('.update-btn').addEventListener('click', () => handleUpdateRoom(room.id));

        return row;
    }

    // time format
    function formatOngoingSchedule(room) {
        if (room.ongoing_schedule && room.ongoing_schedule.starting_time && room.ongoing_schedule.ending_time) {
            const startTime = dateTimeFormat(room.ongoing_schedule.starting_time);
            const endTime = dateTimeFormat(room.ongoing_schedule.ending_time);
            return `${startTime} - ${endTime}`;
        }
        return 'N/A';
    }

    // update button click
    async function handleUpdateRoom(roomId) {
        try {
            const response = await RoomViewModel.getRoomById(roomId);
            if (response.success) {
                populateModalForm(response.room);
                openModal();
            } else {
                showToast(response.message || 'Room not found', 'error');
            }
        } catch (error) {
            console.error('Error fetching room:', error);
            showToast('Error loading room details', 'error');
        }
    }

    // room form submission (create/update)
    async function handleRoomFormSubmit(event) {
        event.preventDefault(); 

        const roomId = document.getElementById('roomIdField').value; 
        const formData = new FormData(event.target);
        
        // form data
        const updatedData = {
            room_id: roomId || undefined, 
            room_number: formData.get('roomNumber'),
            room_building: formData.get('roomBuilding'),
            capacity: formData.get('capacity'),
            room_type: formData.get('roomType'),
            status: formData.get('availability'),
            equipment: [],
        };

        // equipment values
        document.querySelectorAll('.equipment input[type="checkbox"]:checked').forEach(checkbox => {
            updatedData.equipment.push(checkbox.value);
        });
        
        // join equipments
        updatedData.equipment = updatedData.equipment.join(',');

        try {
            let response;
            if (updatedData.room_id) {
                response = await RoomViewModel.updateRoom(updatedData.room_id, updatedData);
                if (response.status === 'success') {
                    showToast(response.message, 'success');
                    await fetchRooms();
                    closeModal();
                }
            } else {
                response = await RoomViewModel.createRoom(updatedData);
                console.log('Response from ViewModel:', response);
                if (response.status === 'success') {
                    showToast(response.message, 'success');
                    await fetchRooms();
                    closeModal();
                    openRoomCreatedModal(response.roomId); 
                }
            }
        } catch (error) {
            console.error('Error processing room form:', error);
            showToast('Error processing room form', 'error');
        }
    }        

    // populate datas to form
    function populateModalForm(room) {
        // set room number based on building
        addRoomBldgSelect.value = room.room_building;
        updateRoomNumberOptions(room.room_building);
        
        // form values
        document.getElementById('roomIdField').value = room.id;
        roomNumberSelect.value = room.room_number;
        document.querySelector('input[name="capacity"]').value = room.capacity;
        document.querySelector('select[name="roomType"]').value = room.room_type;
        document.querySelector('select[name="availability"]').value = room.status;
    
        // equipment values
        const equipment = room.equipment?.split(',') || [];
        document.querySelectorAll('.equipment input[type="checkbox"]').forEach(checkbox => {
            checkbox.checked = equipment.includes(checkbox.value.trim());
        });
        document.querySelector('.createbtn').textContent = 'Update';
    }

    // clear create room form 
    function clearForm() {
        document.getElementById('roomIdField').value = '';
        roomForm.reset(); 
        document.querySelectorAll('.equipment input[type="checkbox"]').forEach(checkbox => {
            checkbox.checked = false;
        });
    }

    // add schedule form 
    const scheduleForm = document.getElementById('addscheduletoroomform');  
    scheduleForm.addEventListener('submit', handleScheduleFormSubmit);

    async function handleScheduleFormSubmit(event) {
        event.preventDefault(); 

        const roomId = addScheduleModal.getAttribute('data-room-id'); 
        if (!roomId) {
            console.error('Room ID is missing');
            return;
        }

        const formData = new FormData(event.target);
        let startTime = formData.get('timeStart'); 
        let endTime = formData.get('timeEnd');
    
        startTime = startTime + ":00";
        endTime = endTime + ":00";

        if (startTime >= endTime) {
            showToast('Starting time must be before ending time', 'error');
            return; 
        }

        // schedule data from form
        const scheduleData = {
            room_id: roomId,
            block: formData.get('block'),          
            date: formData.get('date'),  
            starting_time: startTime,
            ending_time: endTime      
        };

        console.log('Schedule Data:', scheduleData);

        try {
            const response = await RoomScheduleViewModel.createRoomSchedule(scheduleData); 

            if (response.status === 'success') {
                showToast(response.message, 'success');
                closeAddScheduleModal();  
                fetchRooms(); 
            } else if (response.status === 'error') {
                showToast(response.message, 'error');
            }
        } catch (error) {
            console.error('Error creating schedule:', error);
            showToast('Error creating schedule', 'error');
        }
    }

    // remove room confirmation msg
    function handleRemoveRoom(roomId, row) {
        showToast('Are you sure you want to remove this room?', 'info', {
            showButtons: true,
            onConfirm: () => removeRoom(roomId, row),
            onCancel: () => showToast('Room removal canceled', 'info')
        });
    }

    // remove room 
    async function removeRoom(roomId, row) {    
        row.classList.add('ud-button-animation');
        
        setTimeout(async () => {
            try {
                const response = await RoomViewModel.deleteRoom(roomId);
                if (response.success) {
                    row.remove();
                    showToast(response.message, 'success');
                } else {
                    showToast(response.message || 'Failed to remove room', 'error');
                }
            } catch (error) {
                console.error('Error removing room:', error);
                showToast('Error removing room', 'error');
            }
        }, 500); 
    }


    // Search filter
    function filterTable() {
        const rows = document.querySelectorAll('.room-item');
        rows.forEach(row => {
            const building = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
            const number = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
            const matchesSearch = building.includes(searchText) || number.includes(searchText);
            row.style.display = matchesSearch ? '' : 'none';
        });
    }

    initModal();
    fetchRooms();
    searchBar.addEventListener('input', () => {
        searchText = searchBar.value.toLowerCase();
        filterTable();
    });
}