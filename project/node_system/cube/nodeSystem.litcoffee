### Opzet scene en licht

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

# Een kubus

Hier een verhaal dat van alles uitlegt over het element en zijn samenhang.

    geometry = new THREE.BoxGeometry( 1, 1, 1 )
    material = new THREE.MeshLambertMaterial( { color: 0xff530f } )
    element = new THREE.Mesh( geometry, material )
    scene.add( element )

### Praktisch

Momenteel is het te technisch uitdagend om deze manier van stl-bestanden genereren te veranderen.

    # Genereren file.
    elementSTL = exporter.parse( element )
    blob = new Blob([elementSTL], {type: "text/plain;charset=utf-8"})
    # saveAs(blob, "element.stl") # Verwijder comment wanneer je de stl-file (opnieuw) wilt genereren.v

### Camera instellingen & inschakeling

    # Camera die interactief controleerbaar is.
    controls = new THREE.OrbitControls(camera, renderer.domElement)
    camera.position.x = 2
    camera.position.y = 3
    camera.position.z = 4
    controls.target = new THREE.Box3().setFromObject(scene).getCenter()
    controls.update()

    # Animeren met de interactie-mogelijkheid.
    animate = ->
        requestAnimationFrame animate
        renderer.render scene, camera
    animate()

    # Alles samenvoegen.
    renderer.render scene, camera
