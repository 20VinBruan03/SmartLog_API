import AdminViewModel from '../viewmodel/adminViewModel.js'; 
import { showToast } from '../viewjs/toast.js';
import { changeTitle } from '../viewjs/dashboard.js';
export function InitUsersListSection() {
    const userListBody = document.getElementById('userListBody');
    const filter = document.querySelector('.filter');
    const searchBar = document.querySelector('.search-bar');
    const currentUserId = localStorage.getItem('id');
    changeTitle('Authenticated Users');

    let selectedRole = 'all';
    let searchText = '';

    // event listener
    function initEventListeners() {
        filter.addEventListener('change', handleFilterChange);
        searchBar.addEventListener('input', handleSearchInput);
    }

    // filters
    function handleFilterChange() {
        selectedRole = filter.value;
        filterTable();
    }
    function handleSearchInput() {
        searchText = searchBar.value.toLowerCase();
        filterTable();
    }

    // get all users list
    function fetchUsers() {
        userListBody.innerHTML = ''; 

        AdminViewModel.getAllUsers()
            .then(result => {
                if (result.success) {
                    if (result.users.length > 0) {
                        result.users.forEach(user => renderUserRow(user));
                    } else {
                        userListBody.innerHTML = `<tr><td colspan="5">No users available.</td></tr>`;
                    }
                } else {
                    userListBody.innerHTML = `<tr><td colspan="5">Error: ${result.message}</td></tr>`;
                }
            })
            .catch(error => {
                console.error('Error loading users:', error);
                userListBody.innerHTML = `<tr><td colspan="5">Failed to load users.</td></tr>`;
            });
    }

    // load user row in the table
    function renderUserRow(user) {
        const row = document.createElement('tr');
        row.classList.add('user-item');

        row.innerHTML = `
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
            <td>${user.teacher_id || 'N/A'}</td>
            <td>
                <button class="remove-btn" data-user-id="${user.id}" data-role="${user.role}">Remove</button>
            </td>
        `;
        userListBody.appendChild(row);

        const removeBtn = row.querySelector('.remove-btn');
        removeBtn.addEventListener('click', () => handleRemoveUser(user, row));
    }

    // delete user
    function handleRemoveUser(user, row) {
        const userId = user.id;
        const userRole = user.role;

        if (userId === currentUserId) {
            showToast('Are you sure you want to delete your own account?', 'warning', {
                showButtons: true,
                onConfirm: () => deleteUserAccount(userId),
                onCancel: () => console.log('User deletion canceled'),
            });
        } else {
            showToast('Are you sure you want to delete this user?', 'info', {
                showButtons: true,
                onConfirm: () => deleteUser(userId, userRole, row),
                onCancel: () => console.log('User deletion canceled'),
            });
        }
    }

    // delete logged in user 
    function deleteUserAccount(userId) {
        AdminViewModel.deleteAdmin(userId)
            .then(response => {
                if (response.success) {
                    logoutAndRedirect();
                } else {
                    showToast(response.message, 'error');
                }
            })
            .catch(error => {
                console.error('Error deleting user:', error);
                showToast('Failed to delete user', 'error');
            });
    }

    // logout (helper method)
    function logoutAndRedirect() {
        AdminViewModel.logoutUser()
            .then(logoutResponse => {
                showToast(logoutResponse.message || 'Logged out successfully', 'success');
                window.location.href = './view/login.html';
            })
            .catch(logoutError => {
                console.error('Error during logout:', logoutError);
                showToast('Failed to log out', 'error');
            });
    }

    // delete user
    function deleteUser(userId, userRole, row) {
        setTimeout(() => {

            // delete methods based on role
            const deleteMethod = (userRole === 'Administrator' || userRole === 'Staff') 
                ? AdminViewModel.deleteAdmin 
                : AdminViewModel.deleteUser;

            deleteMethod(userId)
                .then(response => {
                    if (response.success) {
                        row.classList.add('ud-button-animation');
                        row.remove();
                        showToast(response.message, 'success');
                    } else {
                        showToast(response.message, 'error');
                    }
                })
                .catch(error => {
                    console.error(`Error deleting ${userRole.toLowerCase()}:`, error);
                    showToast(`Failed to delete ${userRole.toLowerCase()}`, 'error');
                });
        }, 250);
    }


    // based on selected role and search text
    function filterTable() {
        const rows = userListBody.querySelectorAll('tr');
        rows.forEach(row => {
            const usernameCell = row.cells[0];
            const emailCell = row.cells[1];
            const roleCell = row.cells[2];
            const teacherIdCell = row.cells[3];

            const username = usernameCell ? usernameCell.textContent.toLowerCase() : '';
            const email = emailCell ? emailCell.textContent.toLowerCase() : '';
            const userRole = roleCell ? roleCell.textContent.toLowerCase() : '';
            const teacherId = teacherIdCell ? teacherIdCell.textContent.toLowerCase() : '';

            const roleMatches = selectedRole === 'all' || userRole === selectedRole.toLowerCase();
            const searchMatches = username.includes(searchText) || email.includes(searchText) || teacherId.includes(searchText);

            row.style.display = (roleMatches && searchMatches) ? '' : 'none';
        });
    }

    // init 
    function init() {
        initEventListeners();
        fetchUsers();
    }
    init();
}
