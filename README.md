# **Neuroscience-Spike-Triggered Average**

**Neuroscience-Spike-Triggered Average**

The response characteristics of neurons to each input are determined through their Receptive Field; In fact, each neuron's Receptive Field determines which input the neuron is more sensitive to, and the probability of spiking for that input by the neuron is higher. So we are interested in finding the difference between the inputs that caused the spike and the other inputs; In other words, we are looking for a filter estimate that represents the characteristics of the input that the neuron cares about.
In the simplest case (and of course very practical!), one of the critical differences between spike-triggered stimuli and other stimuli can be their average difference. Spike-Triggered Average (abbreviated as STA) is a linear filter that can represent this average change in stimulation.
In fact, to calculate STA, all stimulations that caused the neuron's spiking are obtained in a time window (Time Window) before spiking, and then the average is considered as STA stimulation.



 ![](https://github.com/Fateme-Azizabadi/Neuroscience-Spike-Triggered-Average/blob/main/Images/Result.png)




 
