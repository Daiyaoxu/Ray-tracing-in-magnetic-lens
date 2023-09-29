# Ray-tracing-in-magnetic-lens

This software is a theoretical testing tool, developed to meet the high precision requirements of electron flight tracking in electron microscopy research. At the heart of the software lies a cutting-edge technology that precisely detects axial magnetic field distributions. Leveraging the power series expansion of the Laplace equation, it successfully reconstructs the off-axis magnetic field distribution within a three-dimensional space. This reconstruction capability allows the software to accurately calculate and predict the trajectory of electrons within the magnetic field.

For researchers in the field of microscopy, this tool offers unparalleled insights. Using this software, they can not only pinpoint the exact location and size of the electron focal point but also gain understanding about lens characteristics under specific magnetic field distributions, such as spherical aberration, coma, and astigmatism. Such profound analysis provides key references for optimizing image quality in microscopy and contributes significantly to the ongoing refinement of electron microscope design and application.
![球差](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/d6e84577-d9c0-498f-b644-d898a0751366)

The figure shows the spherical aberration for different radial magnetic field distributions

When an electron beam passes through a magnetic lens in an electron microscope, the beam can experience distortions, and one of the primary distortions is spherical aberration. Spherical aberration occurs when electrons that pass through different radial distances from the lens axis are focused to different points along the axis. Ideally, all these electrons should converge to a single point, but due to the imperfections in the lens and its magnetic field distribution, this doesn't happen.


![慧差3d1](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/e6d7f2ca-9539-49f4-bf97-ea8f071202d9)
![慧差3D](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/adbb9f12-57ec-414c-acb0-4973aac8b9a8)

The computational results of the three-dimensional hysteresis calculations presented in Fig. Coma aberration arises due to imperfections in the lens or misalignments in the system. The deviation from a perfect magnetic field, combined with the lens geometry and other system factors, can introduce coma.

![慧差](https://github.com/Daiyaoxu/Ray-tracing-in-magnetic-lens/assets/130887176/8052d1b9-7063-4157-b91c-30158d3c92f7)

Shape of coma spots under different twizz parameters of electron beam formation
