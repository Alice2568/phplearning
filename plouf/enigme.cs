using System;
//using System.Collections.Generic;
//using System.Linq;

class Program
{
    static void Main()
    {
        // Données
        var colors = new[] { "rouge", "verte", "blanche", "jaune", "bleue" };
        var nationalities = new[] { "anglais", "suédois", "danois", "norvégien", "allemand" };
        var drinks = new[] { "thé", "café", "lait", "bière", "eau" };
        var cigarettes = new[] { "Pall Mall", "Dunhill", "Blends", "Blue Master", "Prince" };
        var pets = new[] { "chien", "oiseau", "chat", "cheval", "poisson" };

        // Générer toutes les combinaisons possibles
        var permutations = GetPermutations(colors).ToList();

        foreach (var colorPerm in permutations)
        {
            foreach (var nationalityPerm in GetPermutations(nationalities))
            {
                foreach (var drinkPerm in GetPermutations(drinks))
                {
                    foreach (var cigarettePerm in GetPermutations(cigarettes))
                    {
                        foreach (var petPerm in GetPermutations(pets))
                        {
                            var houses = Enumerable.Range(0, 5).Select(i => new House
                            {
                                Color = colorPerm[i],
                                Nationality = nationalityPerm[i],
                                Drink = drinkPerm[i],
                                Cigarette = cigarettePerm[i],
                                Pet = petPerm[i]
                            }).ToArray();

                            if (IsValid(houses))
                            {
                                Console.WriteLine("Solution trouvée :");
                                for (int i = 0; i < houses.Length; i++)
                                {
                                    Console.WriteLine($"Maison {i + 1}: {houses[i]}");
                                }
                                return;
                            }
                        }
                    }
                }
            }
        }

        Console.WriteLine("Pas de solution trouvée.");
    }

    // Vérification des contraintes
    static bool IsValid(House[] houses)
    {
        var colorIndex = houses.ToDictionary(h => h.Color, h => Array.IndexOf(houses, h));
        var nationalityIndex = houses.ToDictionary(h => h.Nationality, h => Array.IndexOf(houses, h));
        var drinkIndex = houses.ToDictionary(h => h.Drink, h => Array.IndexOf(houses, h));
        var cigaretteIndex = houses.ToDictionary(h => h.Cigarette, h => Array.IndexOf(houses, h));
        var petIndex = houses.ToDictionary(h => h.Pet, h => Array.IndexOf(houses, h));

        return (
            houses[nationalityIndex["anglais"]].Color == "rouge" &&                     // L'Anglais habite dans la maison rouge
            houses[nationalityIndex["suédois"]].Pet == "chien" &&                      // Le Suédois a des chiens
            houses[nationalityIndex["danois"]].Drink == "thé" &&                       // Le Danois boit du thé
            colorIndex["verte"] == colorIndex["blanche"] - 1 &&                        // La maison verte est à gauche de la maison blanche
            houses[colorIndex["verte"]].Drink == "café" &&                             // Le propriétaire de la maison verte boit du café
            houses[cigaretteIndex["Pall Mall"]].Pet == "oiseau" &&                     // Celui qui fume Pall Mall élève des oiseaux
            houses[colorIndex["jaune"]].Cigarette == "Dunhill" &&                      // Le propriétaire de la maison jaune fume Dunhill
            houses[2].Drink == "lait" &&                                               // La personne vivant dans la maison du milieu boit du lait
            nationalityIndex["norvégien"] == 0 &&                                      // Le Norvégien habite dans la première maison
            Math.Abs(cigaretteIndex["Blends"] - petIndex["chat"]) == 1 &&              // Celui qui fume Blends vit à côté de celui qui a des chats
            Math.Abs(cigaretteIndex["Dunhill"] - petIndex["cheval"]) == 1 &&           // Celui qui fume Dunhill vit à côté de celui qui a un cheval
            houses[cigaretteIndex["Blue Master"]].Drink == "bière" &&                  // Celui qui fume Blue Master boit de la bière
            houses[nationalityIndex["allemand"]].Cigarette == "Prince" &&              // L'Allemand fume des Prince
            Math.Abs(nationalityIndex["norvégien"] - colorIndex["bleue"]) == 1 &&      // Le Norvégien vit à côté de la maison bleue
            Math.Abs(cigaretteIndex["Blends"] - drinkIndex["eau"]) == 1                // Celui qui fume Blends a un voisin qui boit de l'eau
        );
    }

    // Générer les permutations
    static IEnumerable<T[]> GetPermutations<T>(T[] items)
    {
        if (items.Length == 1)
            yield return items;
        else
        {
            foreach (var perm in GetPermutations(items.Skip(1).ToArray()))
            {
                for (int i = 0; i <= perm.Length; i++)
                {
                    yield return perm.Take(i).Concat(new[] { items[0] }).Concat(perm.Skip(i)).ToArray();
                }
            }
        }
    }

    // Classe pour représenter une maison
    class House
    {
        public string Color { get; set; }
        public string Nationality { get; set; }
        public string Drink { get; set; }
        public string Cigarette { get; set; }
        public string Pet { get; set; }

        public override string ToString()
        {
            return $"Couleur: {Color}, Nationalité: {Nationality}, Boisson: {Drink}, Cigarette: {Cigarette}, Animal: {Pet}";
        }
    }
}
