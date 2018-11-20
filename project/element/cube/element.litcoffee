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
    # saveAs(blob, "element.stl") # Verwijder comment wanneer je de stl-file (opnieuw) wilt genereren.
