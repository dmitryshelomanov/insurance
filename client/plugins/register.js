import Vue from 'vue';
import { substrCommon } from '~/helpers/substrCommon.js'

Vue.directive('substr', {
	inserted: substrCommon,
	update: substrCommon,
})
