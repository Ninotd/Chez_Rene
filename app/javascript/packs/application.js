import "bootstrap";
// import $ from 'jquery';
// import 'select2';

// $(document).ready(function() {
//     $('select').select2();
// });

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { selectCategory } from '../plugins/select_category';
import '../plugins/select_category';

initMapbox();
selectCategory();

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import 'plugins/flatpickr'
