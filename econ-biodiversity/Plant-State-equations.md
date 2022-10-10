Let the number of berries $B_{(j,k,l)_t}$ grown by each branch $j$ on each plant $k$ in each grid $l$ for each time period $t$ be given by the following pay off-function equation in Berry-Days :

$$
BD_t = BD_{t-1} + \alpha*HL_{(j,k,l)_{t-1}} + \beta*IL_{(j,k,l)_{t-1}} 
$$

where $\beta$ is the number of leaf-berry-days made by a diseased leaf and $\alpha$ is the number of berry-days made by a healthy leaf.

Then, when $BLD_t$ crossses a threshold value $x$ (or accumulates enough berry-days), a coffee berry is produced. The evolution of berries is given by the following code:

```
# get prize if you get a whole number
berries_t = np.floor(berry_days_t / x) + berries_t-1
# if you get a prize reinitalize berry-leaf-days to remainder
if np.floor(berry-leaf-days_t / x) > 0:
    berry_days_t =  berry_days_t - x
```

Let the number of leaf days $LD_{(j,k,l)_t}$ made by each branch $j$ on each plant $k$ in each grid $l$ for each time period $t$ be given by the following pay off-function equation in Leaf-Leaf-Days :

$$
LD_t = LD_{t-1} + \gamma*HL_{(j,k,l)_{t-1}} + \theta*IL_{(j,k,l)_{t-1}}
$$

where $\theta$ is the number of leaf-days made by an infected leaf and $\gamma$ is the number of leaf-days made by a healthy leaf.

Then, when $LD_t$ crossses a threshold value $x$ (or accumulates enough leaf-days), a new leaf on the branch is produced. The evolution of leaves is given by the following code:

```
# get prize if you get a whole number
leaves_t = np.floor(leaf_days_t / x) + leaves_t-1
# if you get a prize reinitalize berry-leaf-days to remainder
if np.floor(leaf_days_t / x) > 0:
    leaf_days_t =  leaf_days_t - x
```