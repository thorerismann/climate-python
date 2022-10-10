Let the chance of an infected leaf $il_{(i,j,k,l)_t}$ transmitting the virus to a healthy leaf $hl_{(i,j,k,l)_t}$ on the same plant on the same branch be $\theta$.

So for each healthy leaf the probability that it becomes infected from a diseased leaf on the same branch can be modelled as a series of independent bernoulli trials. Therefore the probability that at least one infected leaf passed on the infection is 1 - P(does not become infected). Let $HL_{(i,j,k,l)_t}$ and $IL_{(i,j,k,l)_t}$ be the total number of healthy and infected leaves at time $t$ respectively. Thus, for each $hl_{(i,j,k,l)_t}$
$$
P(Infected)_{t-1} = \theta_{(i,j,k,l)_{t-1}} = 1- P(NotInfected)_{t-1}
$$
$$
\theta_{(i,j,k,l)_{t-1}} = 1- {IL_{(j,k,l)_{t-1}} \choose 0}*\theta^0*(1-\theta)^{IL_{(j,k,l)_{t-1}}}
$$

$$\theta_{(i,j,k,l)_{t-1}} = 1- (1-\theta)^{IL_{(j,k,l)_{t-1}}}$$ 

Then further assuming independence, the number of healthy leaves that became infected is given by the following:

$$
IL_{(j,k,l)_{t}} = IL_{(j,k,l)_{t-1}} + HL_{(j,k,l)_{t-1}}*\theta_{(i,j,k,l)_{t-1}}
$$
And the number of healthy leaves follows:
$$
HL_{(j,k,l)_t} = HL_{(j,k,l)_{t-1}} - HL_{(j,k,l)_{t-1}}*\theta_{(i,j,k,l)_{t-1}}
$$

But since cross branch infection occurs at rate $\phi$ for each each infected leaf $il_{(i,-j,k,l)_t}$ on the other branches of the plant, then the probability of infecting a healthy leaf on a given branch $hl_{(i,j,k,l)_t}$ is given by summing across all infected leaves on all branches but branch $j$. Following the reasoning above:

$$
P(Infected)_{t-1} = \phi_{(i,j,k,l)_{t-1}} = 1- P(NotInfected)_{t-1}
$$
$$
\phi_{(i,j,k,l)_{t-1}} = 1- {IL_{(-j,k,l)_{t-1}} \choose 0}*\phi^0*(1-\phi)^{IL_{(-j,k,l)_{t-1}}}
$$

$$\phi_{(i,j,k,l)_{t-1}} = 1- (1-\phi)^{IL_{(-j,k,l)_{t-1}}}$$ 

So the number of leaves infected by neighboring branches on a branch $j$ and the number of healthy leaves remaining is:
$$
IL_{(j,k,l)_{t}} = IL_{(j,k,l)_{t-1}} + HL_{(j,k,l)_{t-1}}*\phi_{(i,j,k,l)_{t-1}}
$$
And the remaining healthy leaves:
$$
HL_{(j,k,l)_{t}} = HL_{(j,k,l)_{t-1}} - HL_{(j,k,l)_{t-1}}*\phi_{(i,j,k,l)_{t-1}}
$$

Fruther, the chance of each infected leaf $il_{(i,j,k,l)_t}$ transmitting the virus to a new leaf on a different plant in the same grid is $\gamma$ so the probability of a given leaf i getting infected by an infected leaf from a different plant is given by:

$$
P(Infected)_{t-1} = \gamma_{(i,j,k,l)_{t-1}} = 1- P(NotInfected)_{t-1}
$$

$$
\gamma_{(i,j,-k,l)_{t-1}} = 1- {IL_{(-k,l)_{t-1}} \choose 0}*\gamma^0*(1-\gamma)^{IL_{(-k,l)_{t-1}}}
$$

$$\gamma_{(i,j,k,l)_{t-1}} = 1- (1-\gamma)^{IL_{(-k,l)_{t-1}}}$$

Therefore the number of healthy leaves that are infected on a given branch of a given plant by a different plant is the following:

$$
IL_{(j,k,l)_{t}} = IL_{(j,k,l)_{t-1}} + HL_{(j,k,l)_{t-1}}*\gamma_{(i,j,k,l)_{t-1}}
$$

$$
HL_{(j,k,l)_{t}} = HL_{(j,k,l)_{t-1}} - HL_{(j,k,l)_{t-1}}*\gamma_{(i,j,k,l)_{t-1}}
$$

Putting it all together the actual probability of infection for each healthy leaf on a given branch $j$ on a given plant $k$, for a given grid square $l$, again assuming independence between all infection events, is:

$$
\beta_{(i,j,k,l)_{t-1}} = \theta_{(i,j,k,l)_{t-1}} + \phi_{(i,j,k,l)_{t-1}} + \gamma_{(i,j,k,l)_t} - \gamma_{(i,j,k,l)_{t-1}}*\phi_{(i,j,k,l)_{t-1}}*\theta_{(i,j,k,l)_{t-1}} - \phi_{(i,j,k,l)_{t-1}}*\theta_{(i,j,k,l)_{t-1}} - \gamma_{(i,j,k,l)_{t-1}}*\phi_{(i,j,k,l)_{t-1}} - \gamma_{(i,j,k,l)_{t-1}}*\theta_{(i,j,k,l)_{t-1}}
$$

We then use $\beta_{(i,j,k,l)_{t-1}}$ to calculate 

$$
HL_{(j,k,l)_{t}} = HL_{(j,k,l)_{t-1}}- \beta_{(i,j,k,l)_{t-1}}*HL_{(j,k,l)_{t-1}}
$$

We will assume that transmission between grid cells occurs only during a storm. Let $\delta$ be the probability of the storm and $\alpha$ represent the likeliehood of cross grid contamination if a storm occurs.

TO BE CONTINUED

So for any leaf the probability that it becomes infected with coffee leaf rust in any period is given by: