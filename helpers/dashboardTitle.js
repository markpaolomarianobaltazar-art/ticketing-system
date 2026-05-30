function getDashboardTitle(role) {
    if (role === 'technician') {
        return 'Technician Dashboard';
    }
    if (role === 'admin') {
        return 'Admin Dashboard';
    }
    return 'Client Dashboard';
}
module.exports = getDashboardTitle;