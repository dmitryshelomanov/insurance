export const substrCommon = function (el, bind) {
	if (bind.value.match(/<iframe .+><\/iframe>/g)) {
		return el.innerHTML = bind.value.match(/<iframe .+><\/iframe>/g);
	} 
	if (bind.value.match(/<img src=["'](.+)['"]>/g)) {
		return el.innerHTML = bind.value.match(/<img src=["'](.+)['"]>/g);
	}
	return el.innerHTML = `${bind.value.substring(0, 100)}...`;
}