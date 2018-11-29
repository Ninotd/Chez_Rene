import "bootstrap";
// import $ from 'jquery';
// import 'select2';

// $(document).ready(function() {
//     $('select').select2();
// });

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '../plugins/select_category';

initMapbox();

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import 'plugins/flatpickr'
