// Entrypoint for the esbuild command defined in package.json scripts

import "bootstrap/dist/js/bootstrap.bundle"
import "bootstrap/dist/css/bootstrap.css"
// to add event listeners it is enough to add file to "javascript folder" and import it here
// !! do not forget to enter command "yarn build --watch" every time before running server
import "chartkick"
// import "Chart.bundle"
import "chartkick/chart.js"
import 'chart.js/auto'
import "./packs/generate-indicator"
import "./packs/generate-graph"
import "./channels"
import "./channels/indicator_channel"
