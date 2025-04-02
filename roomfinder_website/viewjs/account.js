
// account sec dom/M
import AdminViewModel from "../viewmodel/adminViewModel.js";
import { showToast } from '../viewjs/toast.js';  
import { changeTitle } from "./dashboard.js";

export function InitAccountSection() {
    console.log('init account.js')
    const username = localStorage.getItem('username');
    const email = localStorage.getItem('email');
    const adminId = localStorage.getItem('id')

    changeTitle('Account');

    if (!username || !email || !adminId) {
        console.error('No data in localstorage.');
        return;
    }

    document.querySelector('.profileName').textContent = username;
    document.querySelector('.profileEmail').textContent = email;

    // const profileContainer = document.querySelector('.profile-container');
    // if (profilePic) {
    //     profileContainer.innerHTML = `<img src="${profilePic}" alt="Profile Picture" class="profile-pic">`;
    // }

    // change pass
    const form = document.querySelector('.acct_settingform');
    form.addEventListener('submit', async (event) => {
        event.preventDefault();

        const oldPassword = document.getElementById('oldPassword').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            showToast('New password and confirm password do not match. Please try again', 'error');
            return; 
        }
        
        const result = await AdminViewModel.updatePassword(adminId, oldPassword, newPassword, confirmPassword);
        
        if (result.status === 'success') {
            showToast(result.message, 'success');
            form.reset(); 
        } else {
            showToast(result.message, 'error');
        }
    });
}
