
import AdminModel from '../model/adminModel.js';  
import { showToast } from '../viewjs/toast.js';  

export default class AdminViewModel {

    // login page
    static loginUser(email, password) {
        if (!email || !password) {
            return { status: 'error', message: 'Email and password are required' };
        }

        return AdminModel.login(email, password)
            .then(response => {
                
                if (response.message === 'Login successful!' && response.admin) {
                    const admin = response.admin;
                    const username = admin.username || 'Unknown User';
                    const role = admin.role || 'Unknown Role'; 
                    const email = admin.email || 'Unknown Email';
                    const id = admin.id || 'Unknown ID';

                    // save info
                    localStorage.setItem('authToken', response.token);
                    console.log('Viewmodel auth token:', response.token);
                    localStorage.setItem('username', username); 
                    localStorage.setItem('role', role);
                    localStorage.setItem('email', email);
                    localStorage.setItem('id', id);

                    return { status: 'success', username, role, email, id };
                } else {
                    return { status: 'error', message: response.message || 'Login failed' };
                }
            })
            .catch(error => {
                console.error('Error during login:', error);
                return { status: 'error', message: error.message || 'Error occurred while logging in' };
            });
    }


    // add web users form (auth section)
    static async handleSignUp(role, username, email, password, teacher_id) {
        try {
            const response = await AdminModel.addUser(role, username, email, password, teacher_id);
    
            if (!response || !response.message) {   
                throw new Error('Invalid response format from the server');
            }
    
            if (response.status === "success" && response.message) {
                showToast(response.message, 'success');
                return { success: true, message: response.message };
            } else {
                showToast(response.message, 'error');
                return { success: false, message: response.message };
            }
        } catch (error) {
            console.error("Error during sign-up:", error);
            showToast("An error occurred while signing up. Please try again.", 'error');
            return { success: false, message: error.message || 'Error during sign-up' };
        }
    }
    
    
    // get all authenticated users (auth section)
    static async getAllUsers() {
        try {
            const response = await AdminModel.getUsers();
    
            if (response && response['All Users']) {
                return { success: true, users: response['All Users'] };
            } else {
                return { success: false, message: 'No users found in the response' };
            }
        } catch (error) {
            console.error('Error fetching users:', error);
            return { success: false, message: 'Error fetching users' };
        }
    }


    // delete admin (auth section)
    static async deleteAdmin(adminId) {
        try {
            const response = await AdminModel.deleteAdmins(adminId); 
            if (response && response.status === 'success') {
                return { success: true, message: 'User deleted successfully' };
            } else {
                showToast(response.message);
                return { success: false, message: response.message };
            }
        } catch (error) {
            console.error('Error deleting admin:', error);
            return { success: false, message: 'Error deleting admin' };
        }
    }


    // delete user (auth section)
    static async deleteUser(userId) {
        try {
            const response = await AdminModel.deleteUsers(userId);  
            if (response && response.message === 'User deleted successfully') {
                return { success: true, message: 'User deleted successfully' };
            } else {
                showToast(response.message, 'error');
                return { success: false, message: 'Failed to delete user' };
            }
        } catch (error) {
            console.error('Error deleting user:', error);
            return { success: false, message: 'Error deleting user' };
        }
    }  


    // update password
    static async updatePassword(adminId, oldPassword, newPassword, confirmPassword) {
        try {
            const response = await AdminModel.updatePasswordById(adminId, oldPassword, newPassword, confirmPassword);
            
            if (response && response.status === 'success') {
                showToast('Password updated successfully', 'success');
                return { status: 'success', message: 'Password updated successfully' };
            } else {
                showToast(response.message || 'Failed to update password', 'error');
                return { status: 'error', message: response.message || 'Failed to update password' };
            }
        } catch (error) {
            console.error('Error updating password:', error);
            showToast('Error updating password', 'error');
            return { status: 'error', message: 'Error updating password' };
        }
    }


    // logout
    static async logoutUser() {
        try {
            const authToken = localStorage.getItem('authToken');  
            console.log('Auth Token:', authToken);
            if (!authToken) {
                throw new Error('No authentication token found');  
            }
    
            const response = await AdminModel.logout(authToken); 
    
            // remove data to local
            localStorage.removeItem('authToken');
            localStorage.removeItem('username');
            localStorage.removeItem('role');
            localStorage.removeItem('email');
            localStorage.removeItem('id');
    
            if (response && response.message) {
                return { status: 'success', message: response.message };
            }
            return { status: 'success', message: 'Logged out successfully' };
        } catch (error) {
            //still remove if error
            localStorage.removeItem('authToken');
            localStorage.removeItem('username');
            localStorage.removeItem('role');
            localStorage.removeItem('email');
            localStorage.removeItem('id');
    
            console.error('Error during logout:', error);
            return { 
                status: 'error', 
                message: error.message || 'Error occurred during logout' 
            };
        }
    }    
}
