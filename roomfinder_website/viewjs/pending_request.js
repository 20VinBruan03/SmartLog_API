import RoomRequestViewModel from '../viewmodel/roomrequestViewModel.js';
import { showToast } from '../viewjs/toast.js';
import { changeTitle } from './dashboard.js';

export function InitPendingRequestSection() {
    const pendingRequestSection = document.getElementById('pending_request');
    const pendingRequestBody = pendingRequestSection.querySelector('tbody');

    changeTitle('Pending Requests');
    async function init() {
        await loadPendingRequests();
    }

    // get pending requests
    async function loadPendingRequests() {
        try {
            const result = await RoomRequestViewModel.getPendingRequest();
            if (result.success) {
                const pendingRequests = result.pendingRequests;
                if (pendingRequests.length > 0) {
                    renderPendingRequests(pendingRequests);
                } else {
                    pendingRequestBody.innerHTML = `<tr><td colspan="6">No pending requests available.</td></tr>`;
                }
            } else {
                pendingRequestBody.innerHTML = `<tr><td colspan="6">Error: ${result.message}</td></tr>`;
            }
        } catch (error) {
            console.error('Error loading pending requests:', error);
            pendingRequestBody.innerHTML = `<tr><td colspan="6">Failed to load pending requests.</td></tr>`;
        }
    }

    // render pending list
    function renderPendingRequests(pendingRequests) {
        pendingRequestBody.innerHTML = ''; 

        pendingRequests.forEach(request => {
            const row = PendingRequestRow(request);
            pendingRequestBody.appendChild(row);
        });
    }

    // rpending request row
    function PendingRequestRow(request) {
        const row = document.createElement('tr');
        row.classList.add('pending-request-item');

        row.innerHTML = `
            <td>${request.username || 'N/A'}</td>
            <td>${request.date || 'N/A'}</td>
            <td>${request.starting_time || 'N/A'}</td>
            <td>${request.ending_time || 'N/A'}</td>
            <td>${request.purpose || 'N/A'}</td>
            <td>
                <button class="approve-btn" data-id="${request.id}">Approve</button>
                <button class="reject-btn" data-id="${request.id}">Reject</button>
            </td>
        `;
        addRequestEventListeners(row, request);
        return row;
    }

    // approve reject event listener
    function addRequestEventListeners(row, request) {
        const approveBtn = row.querySelector('.approve-btn');
        const rejectBtn = row.querySelector('.reject-btn');

        approveBtn.addEventListener('click', () => updateStatus(request.id, 'Approved', row));
        rejectBtn.addEventListener('click', () => updateStatus(request.id, 'Rejected', row));
    }

    // update status
    async function updateStatus(requestId, status, row) {
        // Display confirmation toast for approval or rejection
        const confirmationMessage = status === 'Approved' 
            ? 'Are you sure you want to approve this request?' 
            : 'Are you sure you want to reject this request?';

        // Show confirmation toast
        showToast(confirmationMessage, 'info', {
            showButtons: true,
            onConfirm: async () => {
                row.classList.add('ud-button-animation');

                setTimeout(async () => {
                    try {
                        const response = await RoomRequestViewModel.updateRequestStatus(requestId, status);

                        if (response.status === 'success') {
                            row.remove(); 
                            if (status === 'Approved') {
                                showToast('Request approved successfully', 'success');
                            } else if (status === 'Rejected') {
                                showToast('Request rejected successfully', 'success');
                            }
                        } else if (response.status === 'error') {
                            showToast(response.message || 'Failed to update request', 'error');
                        }
                    } catch (error) {
                        console.error(`Error changing request status to ${status}:`, error);
                        showToast(`Failed to ${status.toLowerCase()} request`, 'error');
                    }
                }, 500); 
            },
            onCancel: () => {
                showToast('Request update canceled', 'info');
            }
        });
    }

    init();
}
