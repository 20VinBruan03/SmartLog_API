
// dashboard section dom/M
import RoomRequestViewModel from "../viewmodel/roomrequestViewModel.js";
import { dateTimeFormat } from '../viewjs/timeformat.js';


export function changeTitle(titleHeader) {
    const title = document.querySelector('.shifting_topbar h2');
    title.textContent = titleHeader;
}

export async function InitDashboard() {

    // showLoading();

    try {
        const response = await RoomRequestViewModel.getDashboardDetails();

        if (response.success) {
            const data = response.history || {};

            // room requeest stats fallback
            const pendingCount = parseInt(data["pending count"]) || 0;
            const approvedCount = parseInt(data["approved count"]) || 0;
            const rejectedCount = parseInt(data["rejected count"]) || 0;

            const totalRequests = pendingCount + approvedCount + rejectedCount;
            const pendingPercentage = totalRequests ? Math.round((pendingCount / totalRequests) * 100) : 0;
            const approvedPercentage = totalRequests ? Math.round((approvedCount / totalRequests) * 100) : 0;
            const rejectedPercentage = totalRequests ? Math.round((rejectedCount / totalRequests) * 100) : 0;

            // room details stats fallback
            const availableCount = parseInt(data["available count"]) || 0;
            const occupiedCount = parseInt(data["occupied count"]) || 0;
            const closedCount = parseInt(data["closed count"]) || 0;

            const totalRoom = availableCount + occupiedCount + closedCount;
            const availablePercentage = totalRoom ? Math.round((availableCount / totalRoom) * 100) : 0;
            const occupiedPercentage = totalRoom ? Math.round((occupiedCount / totalRoom) * 100) : 0;
            const closedPercentage = totalRoom ? Math.round((closedCount / totalRoom) * 100) : 0;
            
            changeTitle('Dashboard');
            // const menu = document.querySelector('#mobile-menu');
            // const menuLinks = document.querySelector('.navbar__menu');
            // menu.addEventListener('click', function () {
            //     showNavbar(menu, menuLinks);
            // });
            
            // dom dashboard stats
            updateTextContent('totalRequests', totalRequests);
            updateTextContent('pendingRequests', data["pending count"] || 0);
            updateTextContent('pendingPercentage', pendingPercentage + '%');
            updateTextContent('approvedRequests', data["approved count"] || 0);
            updateTextContent('approvedPercentage', approvedPercentage + '%');
            updateTextContent('rejectedRequests', data["rejected count"] || 0);
            updateTextContent('rejectedPercentage', rejectedPercentage + '%');

            updateTextContent('totalRooms', totalRoom);
            updateTextContent('availableRooms', data["available count"] || 0);
            updateTextContent('availablePercentage', availablePercentage + '%');
            updateTextContent('occupiedRooms', data["occupied count"] || 0);
            updateTextContent('occupiedPercentage', occupiedPercentage + '%');
            updateTextContent('closedRooms', data["closed count"] || 0);
            updateTextContent('closedPercentage', closedPercentage + '%');

            // dom progress bar
            progressbarAnimation('pendingRequestBox', pendingPercentage);
            progressbarAnimation('approvedRequestBox', approvedPercentage);
            progressbarAnimation('rejectedRequestBox', rejectedPercentage);
            progressbarAnimation('availableRoomBox', availablePercentage);
            progressbarAnimation('occupiedRoomBox', occupiedPercentage);
            progressbarAnimation('closedRoomBox', closedPercentage);

            // ongoing schedules table 
            const ongoingScheduleData = data["Ongoing schedule"] || [];
            updateTable('ongoingSchedule', ongoingScheduleData);

            // request history table
            const requestHistoryData = data["Request history"] || [];
            updateTable('requestHistory', requestHistoryData);

            // init btns in dashboard
            InitSeeAllButton();
        }
        else {
            console.error('Error:', response.message);
            showError(response.message);
        }
    }
    catch (error) {
        // if (loadingSpinner) {
        //     loadingSpinner.style.display = 'none';  
        // }
        console.error('Error fetching dashboard details:', error);
        showError('Failed to load dashboard details.');
    }
    // finally {
    //     hideLoading();
    // }

}




// progress bar animation
function progressbarAnimation(boxId, percentage) {
    const box = document.getElementById(boxId);
    if (box) {
        const progressBar = box.querySelector('.progress-bar');
        if (progressBar) {
            progressBar.style.width = `${percentage}%`;
        }
    }
}


// utility update text content
function updateTextContent(id, text) {
    const element = document.getElementById(id);
    if (element) {
        element.innerText = text;
    }
}

// utility update table row data
function updateTable(tableId, data) {
    const tableBody = document.getElementById(tableId).querySelector('tbody');
    tableBody.innerHTML = '';

    // limit to 5 items
    const limitedData = data.slice(0, 5);

    if (Array.isArray(limitedData) && limitedData.length > 0) {
        limitedData.forEach(item => {
            const row = document.createElement('tr');

            // ongoing schedule (dashboard)
            if (tableId === 'ongoingSchedule') {

                const startTime = dateTimeFormat(item.starting_time);
                const endTime = dateTimeFormat(item.ending_time);

                row.innerHTML = `
                    <td>${item.room_building + ' ' + item.room_number || 'N/A'}</td> 
                    <td>${item.date + '<br/>' + startTime + ' - ' + endTime || 'N/A'}</td>
                    <td>${item.block || 'N/A'}</td>        
                `;
            }
            // request history (dashboard)
            else if (tableId === 'requestHistory') {

                const startTime = dateTimeFormat(item.starting_time);
                const endTime = dateTimeFormat(item.ending_time);

                row.innerHTML = `
                    <td>${item.username || 'N/A'}</td>  
                    <td>${item.date + '<br/>' + startTime + ' - ' + endTime || 'N/A'}</td>
                    <td>${item.block || 'N/A'}</td>     
                `;
            }

            tableBody.appendChild(row);
        });
    }
    else {
        let noDataMessage = '<td colspan="6">No records found<br>&nbsp;</td>';

        // create row
        const row = document.createElement('tr');
        row.innerHTML = noDataMessage;
        tableBody.appendChild(row);
    }
}

// see all buttonn
function InitSeeAllButton() {
    const seeRequestHistoryBtn = document.querySelector('.seerequesthistory-btn');
    if (seeRequestHistoryBtn) {
        seeRequestHistoryBtn.addEventListener('click', function () {
            showSection('pending_request');
        });
    }

    const seeOngoingSchedule = document.querySelector('.seeongoingschedule-btn');
    if (seeOngoingSchedule) {
        seeOngoingSchedule.addEventListener('click', function () {
            showSection('ongoing_schedule');
        });
    }
}

// initial hide sec in dashboard
document.addEventListener('DOMContentLoaded', function () {

    const ongoingScheduleSection = document.getElementById('ongoing_schedule');
    const requestHistorySection = document.getElementById('request_history');

    if (ongoingScheduleSection) {
        ongoingScheduleSection.classList.add('hidden');
    }
    if (requestHistorySection) {
        requestHistorySection.classList.add('hidden');
    }

    // init see all btn
    InitSeeAllButton();
});