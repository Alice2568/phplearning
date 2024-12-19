import itertools

# Données
colors = ["rouge", "verte", "blanche", "jaune", "bleue"]
nationalities = ["anglais", "suédois", "danois", "norvégien", "allemand"]
drinks = ["thé", "café", "lait", "bière", "eau"]
cigarettes = ["Pall Mall", "Dunhill", "Blends", "Blue Master", "Prince"]
pets = ["chien", "oiseau", "chat", "cheval", "poisson"]

# Contraintes (données dans l'énigme)
def is_valid_solution(houses):
    """
    Vérifie si une configuration de maisons respecte toutes les contraintes.
    """
    # Trouver les index des maisons par propriété
    color_index = {house["color"]: i for i, house in enumerate(houses)}
    nationality_index = {house["nationality"]: i for i, house in enumerate(houses)}
    drink_index = {house["drink"]: i for i, house in enumerate(houses)}
    cigarette_index = {house["cigarette"]: i for i, house in enumerate(houses)}
    pet_index = {house["pet"]: i for i, house in enumerate(houses)}
    
    # Contraintes à respecter
    return (
        houses[nationality_index["anglais"]]["color"] == "rouge"  # L'Anglais habite dans la maison rouge.
        and houses[nationality_index["suédois"]]["pet"] == "chien"  # Le Suédois a des chiens.
        and houses[nationality_index["danois"]]["drink"] == "thé"  # Le Danois boit du thé.
        and color_index["verte"] == color_index["blanche"] - 1  # La maison verte est juste à gauche de la maison blanche.
        and houses[color_index["verte"]]["drink"] == "café"  # Le propriétaire de la maison verte boit du café.
        and houses[cigarette_index["Pall Mall"]]["pet"] == "oiseau"  # Celui qui fume Pall Mall élève des oiseaux.
        and houses[color_index["jaune"]]["cigarette"] == "Dunhill"  # Le propriétaire de la maison jaune fume Dunhill.
        and houses[2]["drink"] == "lait"  # La personne vivant dans la maison du milieu boit du lait.
        and nationality_index["norvégien"] == 0  # Le Norvégien habite dans la première maison.
        and abs(cigarette_index["Blends"] - pet_index["chat"]) == 1  # Celui qui fume Blends vit à côté de celui qui a des chats.
        and abs(cigarette_index["Dunhill"] - pet_index["cheval"]) == 1  # Celui qui fume Dunhill vit à côté de celui qui a un cheval.
        and houses[cigarette_index["Blue Master"]]["drink"] == "bière"  # Celui qui fume Blue Master boit de la bière.
        and houses[nationality_index["allemand"]]["cigarette"] == "Prince"  # L'Allemand fume des Prince.
        and abs(nationality_index["norvégien"] - color_index["bleue"]) == 1  # Le Norvégien vit à côté de la maison bleue.
        and abs(cigarette_index["Blends"] - drink_index["eau"]) == 1  # Celui qui fume Blends a un voisin qui boit de l'eau.
    )

# Résolution
def solve_einstein_riddle():
    """
    Résout l'énigme en testant toutes les permutations possibles.
    """
    for colors_perm in itertools.permutations(colors):
        for nationalities_perm in itertools.permutations(nationalities):
            for drinks_perm in itertools.permutations(drinks):
                for cigarettes_perm in itertools.permutations(cigarettes):
                    for pets_perm in itertools.permutations(pets):
                        houses = [
                            {"color": colors_perm[i],
                             "nationality": nationalities_perm[i],
                             "drink": drinks_perm[i],
                             "cigarette": cigarettes_perm[i],
                             "pet": pets_perm[i]}
                            for i in range(5)
                        ]
                        if is_valid_solution(houses):
                            return houses

# Résultat
solution = solve_einstein_riddle()
if solution:
    for i, house in enumerate(solution):
        print(f"Maison {i + 1} : {house}")
else:
    print("Pas de solution trouvée.")
