    # OBJ exporter
    exporter = new THREE.STLExporter

    # Scene setup
    element = document.getElementById 'three-js-canvas'
    scene = new THREE.Scene
    scene.background = new THREE.Color( 0x74b3cc );
    camera = new THREE.PerspectiveCamera 75, element.clientWidth / element.clientHeight, 1, 10000
    renderer = new THREE.WebGLRenderer canvas: element
    renderer.setSize element.clientWidth, element.clientHeight
    renderer.setPixelRatio(window.devicePixelRatio ? window.devicePixelRatio || 1)
    #light
    light = new THREE.PointLight( 0xffffff, 3, 100 )
    light.position.set( 10, 20, 15 )
    scene.add( light )
