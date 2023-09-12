# CI/CD planning

When deciding on the CI/CD platform we'll be using, we have the following key requirements:

1. Cloud-based, so as to not require maintenance on our end,
2. Capable of building Docker images with ease,
3. Flexibility as the application grows and requirements change,
4. Statistics and Metrics for builds, errors, and similar

Furthermore, the following are nice to haves:

1. Easy deployments to Kubernetes,
2. A proven track record for security,
3. High-quality support for Open Source software.

When comparing tools, we'd ultimately be looking at:

1. Performance to Cost Ratio
2. The Quality of our Key Requirements
3. An active community

Based on my previous experience with the platform, CircleCI would be an ideal candidate as it hits our must-haves. However, it is lagging behind in the nice-to-haves, so it is by no means the only option. 
GitHub Actions is not quite as flexible in terms of performance, but it is not only very easy and convenient to set up, it is also extremely popular. This popularity ensures that any issues we run into have likely been encountered before.

Our plan would be as follows:

1. Create unit tests for our application.
2. Build the Docker Image
3. Run the Application/Python image with environment variables set to connect to a side-car image for MySQL.
4. If testing is successful, push our update to our Docker Registry. If not, alert and halt.

Note that steps 2 and 3 can change places, depending on our error detection and how long the docker build stage takes.