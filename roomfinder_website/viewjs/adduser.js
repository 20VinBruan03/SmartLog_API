// adduser.js
import AdminViewModel from '../viewmodel/adminViewModel.js';    
import { showToast } from './toast.js';
import { changeTitle } from './dashboard.js';

export function InitAddUserSection() {

    const addBtn = document.querySelector('.addBtn');
    const backBtn = document.querySelector('.backBtn');
    const roleSelector = document.getElementById('role');
    const teacherIdContainer = document.getElementById('teacher-id-container');
    const teacherIdInput = document.getElementById('teacherID');
    changeTitle('Add Users');

    // hide teacher id input field bif role != teacher
    if (roleSelector.value === 'Teacher') {
        teacherIdContainer.style.display = 'block'; 
    } else {
        teacherIdContainer.style.display = 'none'; 
    }

    roleSelector.addEventListener('change', function() {
        const role = roleSelector.value;
        if (role === 'Teacher') {
            teacherIdContainer.style.display = 'block'; 
        } else {
            teacherIdContainer.style.display = 'none'; 
        }
    });

    addBtn.addEventListener('click', async function(event) {
        event.preventDefault();

        const role = document.getElementById('role').value;
        const username = document.getElementById('username').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('ConfirmPassword').value;
        const teacherId = teacherIdInput ? teacherIdInput.value : ''; 

        if (role === 'Teacher' && !teacherId) {
            showToast('Teacher ID is required!', 'error');
            return;
        }

        if (password !== confirmPassword) {
            showToast("Passwords do not match!", 'error');
            return;
        }

        try {
            // add user
            const result = await AdminViewModel.handleSignUp(role, username, email, password, teacherId);

            if (result.success) {
                // reset
                document.getElementById('username').value = '';
                document.getElementById('email').value = '';
                document.getElementById('password').value = '';
                document.getElementById('ConfirmPassword').value = '';

                // reset teacher id 
                if (role === 'Teacher') {
                    teacherIdInput.value = '';
                }
                roleSelector.dispatchEvent(new Event('change'));
            }
        } catch (error) {
            console.error("Error during sign-up:", error);
            showToast("An error occurred while signing up. Please try again.", 'error');
        }
    });

    backBtn.addEventListener('click', function(event) {
        event.preventDefault();
        showSection('dashboard');
    });
}
