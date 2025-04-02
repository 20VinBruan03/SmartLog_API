import { authorizationRole } from './2auth.js';
import Const from '../viewjs/const.js';
export default class RoomModel {

    // get room list route (room page)
    static getRoomList() {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room', {
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
        });
    }

    // get room by id route
    static getRoomById(id) {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + `room/${id}`, {
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
            console.log('Room Data from API:', data);  
            return data;
        })
        .catch(error => {
            console.error('Error fetching room by ID:', error.message);
            throw error;
        });
    }

    // create room route
    static async createRoom(roomData) {
        const authToken = localStorage.getItem('authToken');
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }

        const response = await fetch(Const.BASE_URL + 'room', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
            body: JSON.stringify(roomData),
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json(); 

        console.log('Response from API:', data);

        if (data.status === 'success') {
            return { status: 'success', message: data.message, roomId: data.id };
        } else if (data.status === 'error') {
            return { status: 'error', message: data.message };
        } else {
            throw new Error('Unexpected response status');
        }
    }

        
    // update room data route
    static updateRoom(id, updatedData) {
        const authToken = localStorage.getItem('authToken');
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }

        return fetch(Const.BASE_URL + `room/${id}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
            body: JSON.stringify(updatedData),
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
            console.error('Error updating room:', error);
            throw error;
        });
    }

    // delete room route 
    static deleteRoomById(id) {
        const authToken = localStorage.getItem('authToken'); 

        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }
        
        return fetch(Const.BASE_URL + `room/${id}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();  
        })
        .then(data => {
            if (data.message === 'Room has been deleted') {
                return { success: true, message: 'Room deleted successfully' };
            } else {
                throw new Error('Failed to delete room');
            }
        })
        .catch(error => {
            console.error('Error deleting room:', error.message);
            throw error; 
        });
    }
}