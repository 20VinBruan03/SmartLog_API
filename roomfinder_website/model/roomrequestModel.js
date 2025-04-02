import { authorizationRole } from './2auth.js';
import Const from '../viewjs/const.js';
export default class RoomRequestModel {

    // get room requests for dashboard route
    static getDashboardDetails() {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room_request', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => { 
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            return data;  
        })
        .catch(error => {
            console.error('Error fetching room requests:', error.message);
            return {};  
        });
    }

    
    // get pending requests route
    static getPendingRequests() {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room_request/pending_request', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => { 
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('Pending Requests:', data);
            return data;
        })
        .catch(error => {
            
            console.error('Error fetching pending requests:', error.message);
        });
    }

    // get all request history route
    static getRequestHistory() {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room_request/history', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => { 
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            return data;
        })
        .catch(error => {
            console.error('Error fetching request history:', error.message);
        });
    }

    // get all request history route
    static getRequestHistory() {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room_request/history', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => { 
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            return data;
        })
        .catch(error => {
            console.error('Error fetching request history:', error.message);
        });
    }
    
    // update pending request status
    static updateRequestStatus(id, status) {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        const requestData = { status: status };

        return fetch(Const.BASE_URL + `room_request/${id}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
            body: JSON.stringify(requestData)
        })
        .then(response => {
            return response.text();  
        })
        .then(text => {
            console.log('Raw response text:', text); 
            try {
                const data = JSON.parse(text); 
                return data;
            } catch (error) {
                console.error('Error parsing JSON:', error);
                throw new Error('Failed to parse response JSON');
            }
        })
        .catch(error => {
            console.error('Error updating request status:', error.message);
        });
    }

    // delete request history route
    static async deleteRequestHistory(id) {
        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }

        try {
            const response = await fetch(Const.BASE_URL + `room_request/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${authToken}`
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();
            return { success: true, message: 'Request deleted successfully' };
        } catch (error) {
            console.error('Error deleting request:', error.message);
            return { success: false, message: `Error deleting request: ${error.message}` };
        }
    }

}    
