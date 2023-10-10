## Ray-tracing-in-magnetic-lens

When an electron beam passes through a magnetic lens in an electron microscope, the beam can experience distortions, primary optical distortions occurs when electrons that pass through different radial distances from the lens axis are focused to different points along the axis. Ideally, all these electrons should converge to a single point, but due to the imperfections in the lens and its magnetic field distribution, this doesn't happen.

This software is a theoretical testing tool, developed to detects axial magnetic field distributions by axis magnetic distribution. The mathmatic principle is based on leveraging the power series expansion of the Laplace equation. It successfully reconstructs the off-axis magnetic field distribution within a three-dimensional space. This reconstruction capability allows the software to accurately calculate and predict the trajectory of electrons within the magnetic field.

For magnetic lenses, to focus on their imaging properties, we first need to calculate their magnetic field distribution and electron trajectory equations. Through these trajectory equations, we can determine their focal plane and the focusing properties on that plane, such as spherical aberration and astigmatism. For rotationally symmetric magnetic fields, we can use Biot-Savart's law.

$$
B=\frac{\mu_0}{4 \pi} \int \frac{I \boldsymbol{d} \boldsymbol{s} \times r_{t t}}{\left|\boldsymbol{r}_{t t}\right|^3}
$$

Through the Laplace equation in cylindrical coordinates, we can obtain the differential equation for the magnetic field distribution.

$$
\frac{\partial^2 A}{\partial r^2}+\frac{1}{r} \frac{\partial A}{\partial r^2}+\frac{\partial^2 A}{\partial z^2}-\frac{A}{r^2}=0
$$

Expanding A in terms of r as a power series, due to rotational symmetry, we can obtain:

$$
\begin{aligned}
B_r(r, z)= & -\frac{1}{2} B^{\prime}(z) r+\frac{1}{16} B^{\prime \prime \prime}(z) r^2-\cdots  +\frac{(-1)^{k+1}}{k !(k+1) !} B^{(2 k+1)}(z)\left(\frac{r}{2}\right)^{2 k+1}+\cdots
\end{aligned}
$$

This equation is the fundamental equation for calculating the axially symmetric magnetic field using the magnetic vector potential.

![球差](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/d6e84577-d9c0-498f-b644-d898a0751366)

The figure shows the spherical aberration for different radial magnetic field distributions

### 3D ray-tracing in magnetic lens 

When we need to observe lens astigmatism, coma distortion, and other asymmetric imaging errors, higher-dimensional particle tracking is required. A system of differential equations is needed to describe the trajectories of electrons in different dimensions.

$$
\begin{aligned}
& m_0 \ddot{r}=-e \frac{\partial Q}{\partial r} \\
& m_0 \ddot{z}=-e \frac{\partial Q}{\partial z} \\
& Q=U_*+\frac{e}{2 m_0}\left(\frac{r A+C}{r}\right)^2
\end{aligned}
$$

Using the differential equations, we can employ numerical calculation methods based on finite differences method, thereby obtaining the flight trajectory of particles in space.

![CleanShot 2023-10-10 at 17 44 16@2x](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/4459aeb8-b7bf-4cdb-9dbc-c145ee6e687d)


The computational results of the three-dimensional hysteresis calculations presented in Fig. Coma aberration arises due to imperfections in the lens or misalignments in the system. The deviation from a perfect magnetic field, combined with the lens geometry and other system factors, can introduce coma.

![慧差](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/8052d1b9-7063-4157-b91c-30158d3c92f7)

Shape of coma spots under different twizz parameters of electron beam formation
