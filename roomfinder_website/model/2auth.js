import { decodeJwt } from '../model/1jwtUtils.js'; 

// get role from the token
export function authorizationRole() {
    const authToken = localStorage.getItem('authToken');
    if (!authToken) {
        throw new Error("You are not authorized");
    }

    // decode token
    const { payload } = decodeJwt(authToken); 

    if (payload.data && payload.data.role) {
        return payload.data.role;  
    } else {
        throw new Error("Role not found in token");
    }
}
