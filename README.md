# Ray-tracing-in-magnetic-lens

This software is a theoretical testing tool, developed to meet the high precision requirements of electron flight tracking in electron microscopy research. This software detects axial magnetic field distributions by axis magnetic distribution. The mathmatic principle of this software is based on leveraging the power series expansion of the Laplace equation. It successfully reconstructs the off-axis magnetic field distribution within a three-dimensional space. This reconstruction capability allows the software to accurately calculate and predict the trajectory of electrons within the magnetic field.

For researchers in the field of microscopy, this tool offers unparalleled insights. Using this software, they can not only pinpoint the exact location and size of the electron focal point but also gain understanding about lens characteristics under specific magnetic field distributions, such as spherical aberration, coma, and astigmatism. Such profound analysis provides key references for optimizing image quality in microscopy and contributes significantly to the ongoing refinement of electron microscope design and application.
![球差](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/d6e84577-d9c0-498f-b644-d898a0751366)

The figure shows the spherical aberration for different radial magnetic field distributions

When an electron beam passes through a magnetic lens in an electron microscope, the beam can experience distortions, and one of the primary distortions is spherical aberration. Spherical aberration occurs when electrons that pass through different radial distances from the lens axis are focused to different points along the axis. Ideally, all these electrons should converge to a single point, but due to the imperfections in the lens and its magnetic field distribution, this doesn't happen.

![CleanShot 2023-10-10 at 17 44 16@2x](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/4459aeb8-b7bf-4cdb-9dbc-c145ee6e687d)


The computational results of the three-dimensional hysteresis calculations presented in Fig. Coma aberration arises due to imperfections in the lens or misalignments in the system. The deviation from a perfect magnetic field, combined with the lens geometry and other system factors, can introduce coma.

![慧差](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/8052d1b9-7063-4157-b91c-30158d3c92f7)

Shape of coma spots under different twizz parameters of electron beam formation
