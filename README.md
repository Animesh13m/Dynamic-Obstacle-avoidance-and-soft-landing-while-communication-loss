# Robust Dynamic Obstacle Avoidance and Autonomous Soft Landing of a Quadcopter under OptiTrack Communication Loss

## Overview

This repository contains the code, Simulink models, and supporting documentation for the M.Tech thesis project focused on enhancing UAV robustness through intelligent fallback mechanisms, safe descent strategies, and real-time image processing. The project was developed using MATLAB/Simulink and tested on the Quanser QDrone platform with OptiTrack motion capture integration.

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
  - **Mission Server** (handles communication, state feedback)
  - **Controller** (handles FSM, control logic, and optimization)
- Real-time data from OptiTrack and RGB-D camera
- Depth noise filtering: sliding average, spatial filtering, block averaging
- Throttle ramping via sigmoid functions for smooth descent
- Persistent memory for robust handling of communication loss

## Technologies Used

- MATLAB & Simulink
- Embedded MATLAB Function blocks
- Quanser QDrone
- OptiTrack Motion Capture System
- RGB-D Camera (e.g., Intel RealSense)
- Brent’s Optimization Algorithm (GSS + SPI hybrid)
- Control Theory & Real-Time Systems

## Folder Structure

