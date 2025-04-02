
// login dom
import AdminViewModel from '../viewmodel/adminViewModel.js';

document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('loginForm');
    // Function to toggle password visibility
    const passwordField = document.getElementById('password');
    const eyeIcon = document.getElementById('eye-icon');

    eyeIcon.addEventListener('click', function () { 
            // Toggle password visibility
            if (passwordField.type === 'password') {
                passwordField.type = 'text';  
                eyeIcon.setAttribute('stroke', '#378e17');  
            } else {
                passwordField.type = 'password';  
                eyeIcon.setAttribute('stroke', 'currentColor');  
            }
    });

    // event listener
    loginForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        AdminViewModel.loginUser(email, password)
            .then(result => {
                console.log(result);

                if (result.status === 'success') {
                    localStorage.setItem('username', result.username);
                    localStorage.setItem('role', result.role);
                    localStorage.setItem('email', result.email);
                    localStorage.setItem('id', result.id)

                    window.location.href = '/roomfinder_website/index.html';
                }
                else {
                    console.error('Login failed:', result.message);
                    document.getElementById('error-message').textContent = result.message;
                    setTimeout(() => {
                        document.getElementById('error-message').textContent = '';
                    }, 3000);
                }
            })
            .catch(error => {
                console.error('Error during login:', error);
            });
    });
});
