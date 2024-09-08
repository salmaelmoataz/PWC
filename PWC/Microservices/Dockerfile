# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 to be public
EXPOSE 5000

# Run the application using gunicorn
CMD ["gunicorn","run:app", "-b", "0.0.0.0:5000", "-w", "4"]
#CMD ["flask", "run", "--host=0.0.0.0"]
