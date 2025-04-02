
// auto load in index.js
// profile view dom/M
// export function updateProfile() {

//     const username = localStorage.getItem('username') || 'Unknown User'; 
//     const role = localStorage.getItem('role') || 'Unknown Role'; 
//     const profilepic = localStorage.getItem('profilepic') || '../roomfinder_website/assets/images/web-svg-icons/profile-default.svg';

//     const profileNameElement = document.getElementsByClassName('profileName')[2];
//     const profileRoleElement = document.getElementsByClassName('profileRole')[1];
//     const profilePicElement = document.getElementsByClassName('profilePic')[1];

//     const profileNameElement_mobile = document.getElementsByClassName('profileName-mobile')[0];
//     const profileRoleElement_mobile = document.getElementsByClassName('profileRole-mobile')[0];
//     const profilePicElement_mobile = document.getElementsByClassName('profilePic-mobile')[0];

//     if (profilePicElement) {
//         profilePicElement.src = profilepic;
//         profilePicElement_mobile.src = profilepic;
//     } else {
//         profilePicElement.src = '../roomfinder_website/assets/images/web-svg-icons/profile-default.svg';
//         profileNameElement_mobile.src = '../roomfinder_website/assets/images/web-svg-icons/profile-default.svg';
//     }
//     // set text content to profile dom
//     if (profileNameElement) {
//         profileNameElement.textContent = username;
//         profileNameElement_mobile.textContent = username;
//     }
//     if (profileRoleElement) {
//         profileRoleElement.textContent = role;
//         profileRoleElement_mobile.textContent = role;
//     }
//     else {
//         console.error('element not found');
//     }
// }

export function updateProfile() {
    const username = localStorage.getItem('username') || 'Unknown User'; 
    const role = localStorage.getItem('role') || 'Unknown Role'; 
    const profilepic = localStorage.getItem('profilepic') || '../roomfinder_website/assets/images/web-svg-icons/profile-default.svg';

    // Select all elements with class profileName, profileRole, and profilePic
    const profileNameElements = document.querySelectorAll('.profileName');
    const profileRoleElements = document.querySelectorAll('.profileRole');
    const profilePicElements = document.querySelectorAll('.profilePic');

    const profileNameElements_mobile = document.querySelectorAll('.profileName-mobile');
    const profileRoleElements_mobile = document.querySelectorAll('.profileRole-mobile');
    const profilePicElements_mobile = document.querySelectorAll('.profilePic-mobile');

    // Update profile name
    profileNameElements.forEach(el => el.textContent = username);
    profileNameElements_mobile.forEach(el => el.textContent = username);

    // Update profile role
    profileRoleElements.forEach(el => el.textContent = role);
    profileRoleElements_mobile.forEach(el => el.textContent = role);

    // Update profile pictures
    profilePicElements.forEach(el => el.src = profilepic);
    profilePicElements_mobile.forEach(el => el.src = profilepic);

    console.log("Profile updated successfully!");
}

