# Robust Dynamic Obstacle Avoidance and Autonomous Soft Landing of a Quadcopter under OptiTrack Communication Loss

## Overview

This repository contains the code, Simulink models, and supporting documentation for the Master thesis project focused on enhancing UAV robustness through intelligent fallback mechanisms, safe descent strategies, and real-time image processing. The project was developed using MATLAB/Simulink and tested on the Quanser QDrone platform with OptiTrack motion capture integration.

## Key Features

- ✅ **Finite State Machine (FSM)**-based architecture for UAV operation  
- 🎯 **Autonomous Soft Landing** using dynamic throttle optimization  
- 🧠 **Brent’s Method** applied for throttle-based obstacle avoidance using RGB-D depth data  
- 📷 **Image Processing Pipeline** for noise reduction and obstacle detection  
- 📡 **Communication Loss Detection** with safe fallback control  
- 🧩 Modular Simulink design integrating real-time sensor data and decision logic  
- 📊 **Experimental Validation** under controlled indoor environment  

## System Architecture

- Dual-program Simulink structure:  
  - **Mission Server:** Handles communication, state feedback, and sensor data acquisition  
  - **Controller:** Manages FSM, control logic, optimization algorithms, and actuation  
- Real-time sensor data from OptiTrack motion capture and RGB-D camera  
- Depth noise filtering techniques including sliding average, spatial filtering, and block averaging  
- Throttle ramping implemented via sigmoid functions to ensure smooth descent during landing  
- Persistent memory and state tracking to robustly handle communication loss scenarios  

## Technologies Used

- MATLAB & Simulink with Embedded MATLAB Function blocks  
- Quanser QDrone – a modular, research-grade quadcopter platform equipped with onboard sensors and compatible with Simulink for real-time control  
- OptiTrack Motion Capture System for precise position and orientation feedback  
- RGB-D Camera (e.g., Intel RealSense) for depth sensing and obstacle detection  
- Brent’s Optimization Algorithm combining Golden Section Search and Successive Parabolic Interpolation  
- Principles of Control Theory and Real-Time Systems  

## About Quanser QDrone

The Quanser QDrone is a highly versatile, research-oriented quadcopter platform designed for rapid prototyping and development of advanced UAV control algorithms. It features:

- Integrated Inertial Measurement Unit (IMU) and onboard sensors  
- High-performance brushless motors and electronic speed controllers (ESCs)  
- Real-time communication interfaces supporting MATLAB/Simulink integration  
- Open architecture for custom firmware and sensor payload integration  
- Compatibility with motion capture systems like OptiTrack for precise flight testing  

The QDrone enables seamless transition from simulation to hardware implementation, making it ideal for academic and research applications involving autonomous navigation, control, and machine learning.

---

Feel free to clone this repository, explore the models, and reproduce the experiments or extend the framework for your own UAV research projects.
Thanks to [Quanser](https://github.com/Quanser) for providing the QDrone platform.

