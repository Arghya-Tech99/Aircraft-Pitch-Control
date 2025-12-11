# Aircraft Pitch Control
The equations governing the motion of an aircraft are a set of six nonlinear coupled differential equations. However, under certain assumptions, they can be decoupled and linearized into longitudinal and lateral equations. Aircraft pitch is governed by the longitudinal dynamics. In this project, an autopilot is designed which controls the pitch of the aircraft (assuming the aircraft is at steady-cruise). The different controllers designed and examined for their performance in this repository are- PID controller and Digital LQR controller.

The basic coordinate axes and forces acting on an aircraft are shown in the figure given below.

![](Results/Screenshot%202025-12-11%20110131.png)

The different design requirements from the autopilot are as follows:
- Overshoot less than 10%
- Rise time less than 2 seconds
- Settling time less than 10 seconds
- Steady-state error less than 2%
