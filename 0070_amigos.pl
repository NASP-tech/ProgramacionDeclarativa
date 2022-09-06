% Pasatiempos:
pasatiempo(bob, pescar_medusas).
pasatiempo(arenita, viajar_por_el_espacio).
pasatiempo(catalina, chocar_vehículos).
pasatiempo(calamardo, tocar_el_clarinete).
pasatiempo(nemo, perderse).
pasatiempo(nemo, pescar_medusas).
pasatiempo(don_cangrejo, hacer_pisto).
pasatiempo(bruce, comer_otros_peces).
pasatiempo(ludovico, pescar_medusas).
pasatiempo(tato, viajar_por_el_espacio).
pasatiempo(nemesia, chocar_vehículos).
pasatiempo(isaura, pescar_medusas).
pasatiempo(patricio, pescar_medusas).
pasatiempo(mari, tocar_el_clarinete).
pasatiempo(alam, hacer_pisto).
pasatiempo(meme, comer_otros_peces).
pasatiempo(dori, olvidar_cosas).

% Comida favorita:
come(bob, hamburguesas).
come(arenita, gomitas).
come(catalina, churritos).
come(patricio, jocotes).
come(calamardo, hamburguesas).
come(don_cangrejo, jocotes).
come(bruce, sandías).
come(ludovico, ceviche).
come(patricio, hamburguesas).
come(tato, macarrones).
come(nemesia, sandías).
come(isaura, pupusas).
come(isaura, hamburguesas).
come(mari, frijoles).
come(alam, huevos_revueltos).
come(meme, hamburguesas).
come(nemo, churritos).
come(nemo, hamburguesas).
come(dori, gomitas).

% Peronalidades de los eres marinos:
personalidad(bob, insoportable).
personalidad(bob, inocente).
personalidad(bob, alegre).
personalidad(calamardo, arrogante).
personalidad(calamardo, gruñón).
personalidad(patricio, bobo).
personalidad(patricio, distraído).
personalidad(patricio, alegre).
personalidad(arenita, inteligente).
personalidad(catalina, estudiosa).
personalidad(don_cangrejo, obsesivo).
personalidad(bruce, violento).
personalidad(ludovico, triste).
personalidad(tato, inteligente).
personalidad(nemesia, dormilona).
personalidad(isaura, intranquila).
personalidad(isaura, alegre).
personalidad(mari, alegre).
personalidad(alam, inocente).
personalidad(meme, bobo).
personalidad(nemo, juguetón).
personalidad(nemo, alegre).
personalidad(dori, olvidadiza).


% Lugar donde viven:
vive_en(bob, fondo_de_bikini).
vive_en(patricio, fondo_de_bikini).
vive_en(calamardo, fondo_de_bikini).
vive_en(arenita, hawaii).
vive_en(catalina, islas_caimán).
vive_en(don_caangrejo, fondo_de_bikini).
vive_en(bruce, barco_hundido).
vive_en(ludovico, charco).
vive_en(tato, caribe).
vive_en(nemesia, mediterráneo).
vive_en(isaura, atlántico).
vive_en(mari, pacífico).
vive_en(alam, luna).
vive_en(meme, luna).
vive_en(nemo, pecera).
vive_en(dori, pacífico).
%vive_en(isaura, fondo_de_bikini).



pueden_ser_amigos(X, Y):-
    pasatiempo(X, Pas),
    pasatiempo(Y, Pas),
    \==(X, Y),
    come(X, Come),
    come(Y, Come),
    personalidad(X, Per),
    personalidad(Y, Per),
    vive_en(X, V),
    vive_en(Y, V).












