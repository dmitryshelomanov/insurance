export const substrCommon = function (el, bind) {
	el.innerHTML = bind.value.substring(0,100) + '...'
}