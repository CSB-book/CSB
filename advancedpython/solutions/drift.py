import scipy  # for random numbers


def build_population(N, p):
    """The population consists of N individuals. 
       Each individual has two chromosomes, containing
       allele "A" or "a", with probability p and 1-p, 
       respectively.

       The population is a list of tuples.
    """
    population = []
    for i in range(N):
        allele1 = "A"
        if scipy.random.rand() > p:
            allele1 = "a"
        allele2 = "A"
        if scipy.random.rand() > p:
            allele2 = "a"
        population.append((allele1, allele2))
    return population


def compute_frequencies(population):
    """ Count the genotypes.
        Returns a dictionary with counts for each genotype.
    """
    AA = population.count(("A", "A"))
    Aa = population.count(("A", "a"))
    aA = population.count(("a", "A"))
    aa = population.count(("a", "a"))
    return({"AA": AA,
            "aa": aa,
            "Aa": Aa,
            "aA": aA})


def reproduce_population(population):
    """ Create a new generation through sexual reproduction
        For each of N new offspring:
        - Choose the parents at random
        - The offspring receives a chromosomes from each of the parents
    """
    new_generation = []
    N = len(population)
    for i in range(N):
        dad = scipy.random.randint(N)  # random integer between 0 and N-1
        mom = scipy.random.randint(N)
        chr_mom = scipy.random.randint(2)  # which chromosome comes from mom
        offspring = (population[mom][chr_mom], population[dad][1 - chr_mom])
        new_generation.append(offspring)
    return(new_generation)
