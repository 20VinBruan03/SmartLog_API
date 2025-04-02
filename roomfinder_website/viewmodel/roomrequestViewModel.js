
import RoomRequestModel from '../model/roomrequestModel.js';
import { showToast } from '../viewjs/toast.js';  

export default class RoomRequestViewModel {

    // get dashboard details route (dashboard)
    static async getDashboardDetails() {
        try {
            const response = await RoomRequestModel.getDashboardDetails();
            if (response) {
                return { success: true, history: response }; 
            } else {
                return { success: false, message: 'No data found' };
            }
        } catch (error) {
            console.error('Error fetching room request history:', error);
            return { success: false, message: 'Error fetching room request history' };
        }
    } 

    // get pending room requests (pending request section)
    static async getPendingRequest() {
        try {
            const response = await RoomRequestModel.getPendingRequests();

            if (response && response["Pending Requests"] && Array.isArray(response["Pending Requests"])) {
                return { success: true, pendingRequests: response["Pending Requests"] };
            } else {
                console.error('Expected "Pending Requests" array but got:', response);
                return { success: false, message: 'Pending Requests not found or invalid response' };
            }
        } catch (error) {
            console.error('Error fetching pending requests:', error);
            return { success: false, message: 'Error fetching pending requests' };
        }
    }

    // update request status (approve or reject)
    static async updateRequestStatus(requestId, status) {
        try {
            const response = await RoomRequestModel.updateRequestStatus(requestId, status);

            if (!response || !response.message) {
                throw new Error(`Invalid response format for request ID ${requestId}`);
            }

            if (response.status === "success" && response.message) {
                return response; 
            } else if (response.status === "error" && response.message) {
                return response; 
            } else {
                throw new Error(`Failed to update status: ${status}`);
            }
        } catch (error) {
            console.error(`Error updating request status for ID ${requestId}:`, error);
            throw error;
        }
    }    

    // get all room request history (request history section)
    static async getRoomRequestHistory() {
        try {
            const response = await RoomRequestModel.getRequestHistory();

            if (response && response['Room Request History']) {
                return { success: true, history: response['Room Request History'] };
            } else {
                return { success: false, message: 'No room request history found' };
            }
        } catch (error) {
            console.error('Error fetching room request history:', error);
            return { success: false, message: 'Error fetching room request history' };
        }
    }

    // delete room request history (viewmodel section)
    static async deleteRoomRequestHistory(requestId) {
        try {
            const response = await RoomRequestModel.deleteRequestHistory(requestId);

            if (response && response.success) {
                return { success: true, message: 'Room request history deleted successfully' };
            } else {
                showToast(response.message, 'error');
                return { success: false, message: response.message };
            }
        } catch (error) {
            console.error('Error deleting room request history:', error);
            return { success: false, message: 'Error deleting room request history' };
        }
    }
}
