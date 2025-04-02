import RoomRequestViewModel from '../viewmodel/roomrequestViewModel.js';
import { showToast } from '../viewjs/toast.js';
import { changeTitle } from './dashboard.js';

export function InitRequestHistorySection() {
    const requestHistorySection = document.getElementById('request_history');
    const requestHistoryBody = requestHistorySection.querySelector('tbody');
    changeTitle('Request History');
    // Initialize the section
    function init() {
        loadRequestHistory();
    }

    // Load request history from the API and render the rows
    async function loadRequestHistory() {
        try {
            const response = await RoomRequestViewModel.getRoomRequestHistory();
            if (Array.isArray(response.history)) {
                if (response.history.length > 0) {
                    renderRequestHistory(response.history);
                } else {
                    requestHistoryBody.innerHTML = `<tr><td colspan="9">No request history available.</td></tr>`;
                }
            } else {
                console.error('Unexpected response format:', response);
                showToast('Failed to load request history', 'error');
            }
        } catch (error) {
            console.error('Error fetching request history:', error);
            showToast('Error fetching request history', 'error');
        }
    }

    // Render each row for request history
    function renderRequestHistory(requestHistory) {
        requestHistoryBody.innerHTML = ''; 

        requestHistory.forEach(request => {
            const row = createRequestRow(request);
            requestHistoryBody.appendChild(row);
        });
    }

    // td row
    function createRequestRow(request) {
        const row = document.createElement('tr');
        row.classList.add('request-item');

        row.innerHTML = `
            <td>${request.username || 'N/A'}</td>
            <td>${request.room_building || 'N/A'}</td>
            <td>${request.room_number || 'N/A'}</td>
            <td>${request.block || 'N/A'}</td>
            <td>${request.date || 'N/A'}</td>
            <td>${request.starting_time || 'N/A'}</td>
            <td>${request.ending_time || 'N/A'}</td>
            <td>${request.status || 'N/A'}</td>
            <td>
                <button class="delete-btn" data-id="${request.id}">Delete</button>
            </td>
        `;

        const deleteBtn = row.querySelector('.delete-btn');
        deleteBtn.addEventListener('click', () => handleDelete(request.id, row));

        return row;
    }

    function handleDelete(requestId, row) {
        // Trigger animation before deletion
        row.classList.add('ud-button-animation'); // Adding the animation class

        // Wait for the animation to complete before actually deleting the row
        setTimeout(async () => {
            try {
                const result = await RoomRequestViewModel.deleteRoomRequestHistory(requestId);
                
                console.log(result);
                if (result.success) {
                    row.remove(); 
                    showToast('Request has been deleted from the history', 'success');
                } else {
                    showToast(result.message, 'error'); 
                }
            } catch (error) {
                console.error('Failed to delete request:', error.message);
                showToast('Failed to delete request', 'error');
            }
        }, 500); 
    }

    init();
}
