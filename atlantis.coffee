element = document.getElementById 'three-js-canvas'
scene = new THREE.Scene
scene.background = new THREE.Color( 0x74b3cc );
camera = new THREE.PerspectiveCamera 75, element.clientWidth / element.clientHeight, 1, 10000
renderer = new THREE.WebGLRenderer canvas: element
renderer.setSize element.clientWidth, element.clientHeight
# renderer.setClearColor( 0xffffff, 0)
renderer.setPixelRatio(window.devicePixelRatio ? window.devicePixelRatio || 1)
# OBJ exporter
exporter = new THREE.OBJExporter
#########################################################################

light = new THREE.PointLight( 0xffffff, 3, 100 )
light.position.set( 27, 35, 22 )
scene.add( light )

geometry = new THREE.BoxGeometry( 1, 1, 1 )
material = new THREE.MeshLambertMaterial( { color: 0xff530f } )
cube = new THREE.Mesh( geometry, material )
scene.add( cube )

cubeOBJ = exporter.parse( cube )

console.log cubeOBJ
console.log "Hello World!"

container = document.getElementById("obj-data")
container.textContent += cubeOBJ

blob = new Blob([cubeOBJ], {type: "text/plain;charset=utf-8"})
# saveAs(blob, "hello world.obj")

#########################################################################
controls = new THREE.OrbitControls(camera, renderer.domElement)
camera.position.x = 2
camera.position.y = 3
camera.position.z = 4
controls.target = new THREE.Box3().setFromObject(scene).getCenter()
controls.update()

t = 0
animate = ->
    requestAnimationFrame animate
    TWEEN.update()
    renderer.render scene, camera
animate()