// SECTION ROUTE HANDLER AND VIEW SECTION JS   

import { updateProfile } from '../viewjs/profile.js';
import { InitDashboard } from '../viewjs/dashboard.js'
import { InitPendingRequestSection } from '../viewjs/pending_request.js'
import { InitUsersListSection } from '../viewjs/userslist.js'; 
import { InitRoomsSection } from '../viewjs/room.js'; 
import { InitRequestHistorySection } from '../viewjs/request_history.js';
import { InitAddUserSection } from '../viewjs/adduser.js';
import { InitAccountSection } from '../viewjs/account.js';
import { InitRoomScheduleSection } from '../viewjs/room_schedule.js';
import { InitOngoingScheduleSection } from '../viewjs/ongoing_schedule.js';
import { showToast } from '../viewjs/toast.js';
import AdminViewModel from '../viewmodel/adminViewModel.js'; 
// section router

const menu = document.querySelector('#mobile-menu');
const menuLinks = document.querySelector('.navbar__menu');
menu.addEventListener('click', function () {
    menu.classList.toggle('is-active');
    menuLinks.classList.toggle('active');
});

window.showSection = function(sectionId) {
    menu.classList.remove('is-active');
    menuLinks.classList.remove('active');
    // hide all sections
    document.querySelectorAll('section').forEach(section => {
    });

    console.log(sectionId);
    
    // load section html view
    fetch(`./view/${sectionId}.html`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Section file not found: ${sectionId}`);
            }
            return response.text();
        })
        .then(content => {
            const mainContent = document.getElementById('content');
            mainContent.innerHTML = content;

            // load profile section
            fetch('./view/profile.html')
                .then(response => response.text())
                .then(profileContent => {
                    const profilePlaceholder = document.querySelector('.profile-container');
                    const profilePlaceholderMobile = document.querySelector('.profile-container-mobile');

                    if (profilePlaceholder && profilePlaceholderMobile) {
                        profilePlaceholder.innerHTML = profileContent;
                        profilePlaceholderMobile.innerHTML = profileContent;

                        const username = localStorage.getItem('username');
                        const role = localStorage.getItem('role');
                        const profilePic = localStorage.getItem('profilepic');

                        if (username && role) {
                            updateProfile(username, role, profilePic);
                        } else {
                            console.error('No profile data found in localStorage.');
                        }
                    }
                })
                .catch(error => {
                    console.error('Error loading profile:', error);
                });
                
            // remove hidden class to section
            const section = document.getElementById(sectionId);
            if (section) {
                section.classList.remove('hidden');

                // initialize section
                if (sectionId === 'dashboard') {
                    InitDashboard();
                }
                else if (sectionId === 'pending_request') {
                    InitPendingRequestSection();
                }
                else if (sectionId === 'request_history') {
                    InitRequestHistorySection();
                }
                else if (sectionId === 'room') {
                    InitRoomsSection();
                }
                else if (sectionId === 'adduser') {
                    InitAddUserSection();
                }
                else if (sectionId === 'userslist') {
                    InitUsersListSection();
                }
                else if (sectionId === 'account') {
                    InitAccountSection();
                }
                else if (sectionId === 'room_schedule') {
                    InitRoomScheduleSection();               
                }
                else if (sectionId === 'ongoing_schedule') {
                    InitOngoingScheduleSection();
                }
            } else {
                console.error(`Section with ID '${sectionId}' not exist`);
            }
        })
        .catch(error => {
            console.error(`Error loading section: ${error.message}`);
            document.getElementById('content').innerHTML = `<p>Error occurred while loading the section.(router.js)</p>`;

        });

    // update active link in the navigation
    document.querySelectorAll('.nav-item').forEach(item => {
        item.classList.remove('active');
    });

    // set active class on the correct link
    document.querySelectorAll('.nav-item').forEach(item => {
        if (item.innerText.trim() === sectionId) {
            item.classList.add('active');
        }
    });

}

// default section 
window.addEventListener('DOMContentLoaded', () => {
    showSection('dashboard');
});

// toggle dropdown when clicked
const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
dropdownToggles.forEach(toggle => {
    toggle.addEventListener('click', function() {
        const dropdown = toggle.parentElement;
        dropdown.classList.toggle('open'); 
    });
});

window.addEventListener('click', function (event) {
    if (!menu.contains(event.target) && !menuLinks.contains(event.target)) {
        menu.classList.remove('is-active');
        menuLinks.classList.remove('active');
    }
});

// close dropdown if clicked outside
window.addEventListener('click', function(event) {
    dropdownToggles.forEach(toggle => {
        const dropdown = toggle.parentElement;
        if (!dropdown.contains(event.target) && !toggle.contains(event.target)) {
            dropdown.classList.remove('open');
        }
    });
});

// logout button 
window.handleLogout = async function(event) {
    event.preventDefault();
 
    // toast msg
    showToast('Are you sure you want to logout?', 'info', {
        showButtons: true,
        onConfirm: async () => {
            try {
                const token = localStorage.getItem('authToken');
                
                if (!token) {
                    showToast('No active session found. Redirecting to login.', 'error');
                    setTimeout(() => {
                        window.location.href = './view/login.html';
                    }, 1500);
                    return;
                }

                // if token exists, logout
                const result = await AdminViewModel.logoutUser();
                
                // remove token
                localStorage.removeItem('authToken');
                
                if (result.status === 'success') {
                    window.location.href = './view/login.html';
                } else {
                    showToast(result.message, 'error');
                    setTimeout(() => {
                        window.location.href = './view/login.html';
                    }, 1500);
                }
            } catch (error) {
                console.error('Logout error:', error);
                showToast('Error during logout', 'error');
                setTimeout(() => {
                    window.location.href = './view/login.html';
                }, 1500);
            }
        },
        onCancel: () => {
        }
    });
};
