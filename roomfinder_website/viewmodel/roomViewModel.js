
import RoomModel from '../model/roomModel.js';
import { showToast } from '../viewjs/toast.js';

export default class RoomViewModel {

    // get all room (room section)
    static async getAllRooms() {
        try {
            const response = await RoomModel.getRoomList();

            if (Array.isArray(response) && response.length > 0) {
                return { success: true, rooms: response };
            } else {
                return { success: true, rooms: []};
            }
        } catch (error) {
            console.error('Error fetching rooms:', error);
            showToast('Error fetching rooms', 'error');
            return { success: false, message: 'Error fetching rooms' };
        }
    }


    // get room by id 
    static async getRoomById(roomId) {
        try {
            const room = await RoomModel.getRoomById(roomId);  
            if (room) {
                return { success: true, room: room };  
            }
            return { success: false, message: 'Room not found or invalid' };
        } catch (error) {
            console.error('Error fetching room:', error);
            return { success: false, message: 'Error fetching room details' };
        }
    }

    // create room 
    static async createRoom(roomData) {
        try {
            const response = await RoomModel.createRoom(roomData);
            console.log('Response from RoomModel.createRoom:', response);
    
            if (response.status === 'success') {
                showToast(response.message, 'success');
                return { success: true, message: response.message, roomId: response.roomId, status: response.status };
            } else if (response.status === 'error') {
                showToast(response.message, 'error');
                return { success: false, message: response.message };
            } else {
                showToast(response.message || 'Error creating room', 'error');
                return { success: false, message: 'Error creating room' };
            }
        } catch (error) {
            console.error('Error in ViewModel during room creation:', error);
            showToast('Error creating room', 'error');
            return { success: false, message: 'Error creating room' };
        }
    }
    


    // update room
    static async updateRoom(roomId, updatedData) {
        try {
            const response = await RoomModel.updateRoom(roomId, updatedData);

            if (response.status === 'success') { 
                showToast(response.message, 'success');
                return { success: true, message: response.message, status: response.status};  
            } else if (response.status === 'error') {
                console.log(response.status);
                showToast(response.message, 'error');
                return { success: false, message: response.message }; 
            } else if (response.success === false) {
                showToast(response.message, 'error');
                return { success: false, message: response.message }; 
            } else {
                showToast('Unexpected error occurred during room update', 'error');
                return { success: false, message: 'Error updating room' }; 
            }
        } catch (error) {
            console.error('Error updating room:', error);
            showToast('Failed to update room', 'error');
            return { success: false, message: 'Error updating room' };
        }
    }


    // delete room method
    static async deleteRoom(roomId) {
        try {
            const response = await RoomModel.deleteRoomById(roomId); 

            if (response.success) {
                showToast('Room deleted successfully', 'success');
                return { success: true, message: 'Room deleted successfully' }; 
            } else {
                showToast(response.message, 'error');
                return { success: false, message: response.message };
            }
        } catch (error) {
            console.error('Error deleting room:', error);
            showToast('Error deleting room', 'error');
            return { success: false, message: 'Error deleting room' };
        }
    }

}
