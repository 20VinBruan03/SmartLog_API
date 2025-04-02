// loading.js

// Show loading spinner
export function showLoading() {
    // Create a loading container if not already present
    let loadingContainer = document.getElementById('loading-container');
    if (!loadingContainer) {
        loadingContainer = document.createElement('div');
        loadingContainer.id = 'loading-container';
        loadingContainer.style.position = 'fixed';
        loadingContainer.style.top = '0';
        loadingContainer.style.left = '0';
        loadingContainer.style.width = '100%';
        loadingContainer.style.height = '100%';
        loadingContainer.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
        loadingContainer.style.display = 'flex';
        loadingContainer.style.justifyContent = 'center';
        loadingContainer.style.alignItems = 'center';
        loadingContainer.innerHTML = `
            <div class="spinner"></div>
        `; // Add your spinner or loader HTML here
        document.body.appendChild(loadingContainer);
    }
    loadingContainer.style.display = 'flex'; // Show the loader
}

// Hide loading spinner
export function hideLoading() {
    const loadingContainer = document.getElementById('loading-container');
    if (loadingContainer) {
        loadingContainer.style.display = 'none'; // Hide the loader
    }
}
