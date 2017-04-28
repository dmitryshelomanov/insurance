let sortAZ = (field) => {
    return (a, b) => {
        if (a[field] > b[field])
            return 1;
        else if (a[field] < b[field])
            return -1;
        else
            return 0;
    }
}
let sortZA = (field) => {
    return (a, b) => {
        if (a[field] > b[field])
            return -1;
        else if (a[field] < b[field])
            return 1;
        else
            return 0;
    }
}
export default (obj, field, method, process) => {
    if (method === 'asc') {
        obj.sort(sortAZ(field));
        process();
    }
    if (method === 'desc') {
        obj.sort(sortZA(field));
        process();
    }
}	