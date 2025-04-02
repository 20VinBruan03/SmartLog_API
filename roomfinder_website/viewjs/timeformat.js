

// time format 
export function dateTimeFormat(time) {
    const [hours, minutes] = time.split(':');
    let hour = parseInt(hours);
    const ampm = hour >= 12 ? 'PM' : 'AM';

    if (hour > 12) {
        hour = hour - 12;
    } else if (hour === 0) {
        hour = 12; 
    }
    const formattedTime = `${hour}:${minutes} ${ampm}`; 
    return formattedTime;
}
