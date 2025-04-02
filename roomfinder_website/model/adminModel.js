import Const from '../viewjs/const.js';
import { authorizationRole } from './2auth.js';

export default class AdminModel {

    // login web users route
    static login(email, password) {
        const loginData = {
            email: email,
            password: password
        };  
        return fetch(Const.BASE_URL + 'admin/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(loginData)
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
            console.error('Error during login:', error);
            throw error;
        });
    }

    // add users route (auth page)
    static addUser (role, username, email, password, teacher_id) {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }

        const userData = {
            role: role,
            username: username,
            email: email,
            password: password,
            teacher_id: teacher_id
        };    
        return fetch(Const.BASE_URL + 'admin/signup', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
            body: JSON.stringify(userData)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('User Added:', data);
            return data;
        })
        .catch(error => {
            console.error('Error adding user:', error);
            throw error;
        });
    }    
    
    // get auth uses list route (auth page)
    static getUsers() {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }
        
        return fetch(Const.BASE_URL + 'admin', {
            method: 'GET',
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
            console.log('User Added:', data);
            return data;
        })
        .catch(error => {
            console.error('Error adding user:', error);
            throw error;
        });
    }
    
    // change password route
    static updatePasswordById(id, oldPassword, newPassword, confirmPassword) {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        const passwordData = {
            old_password: oldPassword,
            new_password: newPassword,
            confirm_password: confirmPassword
        };
        return fetch(Const.BASE_URL + `admin/${id}`, {
            method: 'PATCH', 
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${authToken}`
            },
            body: JSON.stringify(passwordData)
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
            console.error('Error updating password:', error);
            throw error;
        });
    }

    // delete admin route (userlist page)
    static deleteAdmins(id) {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }

        return fetch(Const.BASE_URL + `admin/${id}`, {
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
            console.log('Admin deleted:', data);
            return data;
        })
        .catch(error => {
            console.error('Error deleting admin:', error.message);
        });
    }

    // delete user route (userlist page)
    static deleteUsers(id) {

        const authToken = localStorage.getItem('authToken'); 
        if (!authToken) {
            throw new Error("You are not authorized");
        }

        // check user role
        const userRole = authorizationRole(); 
        if (userRole !== 'Administrator') { 
            return { success: false, message: 'Only Administrator can perform this action' }; 
        }
        
        return fetch(Const.BASE_URL + `user/${id}`, {
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
            console.log('User deleted:', data);
            return data;
        })
        .catch(error => {
            console.error('Error deleting user:', error.message);
        });
    }

    // logout admin
    static logout() {

        const authToken = localStorage.getItem('authToken');

        if (!authToken) {
            throw new Error("You are not authorized");
        }

        return fetch(Const.BASE_URL + 'admin/logout', {
            method: 'POST',
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
            console.error('Error during logout:', error);
            throw error;
        });
    }    
}
