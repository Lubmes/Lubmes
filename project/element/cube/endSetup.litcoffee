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
