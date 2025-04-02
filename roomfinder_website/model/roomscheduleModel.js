import { authorizationRole } from './2auth.js';
import Const from '../viewjs/const.js';

export default class RoomScheduleModel {

    // get all room schedules (room schedule section)
    static getRoomSchedules() {
        const authToken = localStorage.getItem('authToken');

        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room_schedule', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => {
            console.log('Response status:', response.status);  
            if (!response.ok) {
                console.error('Error response:', response); 
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            return data;
        })
        .catch(error => {
            console.error('Error fetching room schedules:', error.message); 
            return [];  
        });
    }

    // get all ongoing schedule route
    static getOngoingSchedules() {
        const authToken = localStorage.getItem('authToken');

        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'room_schedule/ongoing_schedule', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => {
            console.log('Response status:', response.status);
            if (!response.ok) {
                console.error('Error response:', response);
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            return data;
        })
        .catch(error => {
            console.error('Error fetching ongoing schedules:', error.message);
            return [];
        });
    }

    // get room schedule by id 
    static getRoomScheduleById(id) {
        const authToken = localStorage.getItem('authToken');

        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + `room_schedule/${id}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            }
        })
        .then(response => {
            console.log('Response status:', response.status);
            if (!response.ok) {
                console.error('Error response:', response);
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            return data;
        })
        .catch(error => {
            console.error('Error fetching ongoing schedules:', error.message);
            throw error;
        });
    }

    // create room schedule route
    static async createRoomSchedule(scheduleData) {
        const authToken = localStorage.getItem('authToken'); 
    
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }
    
        const response = await fetch(Const.BASE_URL + 'room_schedule', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
            body: JSON.stringify(scheduleData),
        });
    
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        console.log(data);
    
        if (data.status === 'success') {
            return { success: true, message: data.message, status: data.status }; 
        } else if (data.status === 'error') {
            return { success: false, message: data.message, status: data.status };
        } else {
            throw new Error('Unexpected response from the server');
        }
    }

    // update schedule route
    static async updateRoomSchedule(id, scheduleData) {
        const authToken = localStorage.getItem('authToken');
        
        if (!authToken) {
            throw new Error("You are not authorized");
        }
    
        // Check user role
        const userRole = authorizationRole();
        if (userRole !== 'Administrator') {
            return { success: false, message: 'Only Administrator can perform this action' };
        }
    
        try {
            const response = await fetch(Const.BASE_URL + `room_schedule/${id}`, {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${authToken}`
                },
                body: JSON.stringify(scheduleData),
            });
    
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
    
            const data = await response.json(); 
            return data; 
        } catch (error) {
            console.error('Error updating room schedule:', error);
            throw error; // Propagate the error
        }
    }
    
    
    // delete room schedule route
    static async deleteRoomSchedule(id) {
        const authToken = localStorage.getItem('authToken');
        if (!authToken) {
            return { success: false, message: 'You are not authorized', status: 'error' };
        }
    
        const userRole = authorizationRole();
        if (userRole !== 'Administrator') {
            return { success: false, message: 'Only Administrator can perform this action', status: 'error' };
        }
    
        try {
            const response = await fetch(Const.BASE_URL + `room_schedule/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${authToken}`,
                },
            });
            const data = await response.json();
    
            if (data && data.status === 'success') {
                return { success: true, message: data.message, status: data.status };
            } else if (data && data.status === 'error') {
                return { success: false, message: data.message, status: data.status };
            }
            return { success: false, message: 'Unexpected response format', status: 'error' };
    
        } catch (error) {
            console.error('Error deleting room schedule:', error);
            return { success: false, message: 'Failed to delete room schedule', status: 'error' };
        }
    }    
}
