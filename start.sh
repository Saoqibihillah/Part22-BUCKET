set -eu

echo "Starting virtual environment setup..."

export PYTHONUNBUFFERED=true
VIRTUALENV=.data/venv

if [ ! -d $VIRTUALENV ]; then
  echo "Creating virtual environment..."
  python3 -m venv $VIRTUALENV
fi

if [ ! -f $VIRTUALENV/bin/pip ]; then
  echo "Installing pip..."
  curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | $VIRTUALENV/bin/python
fi

echo "Installing requirements..."
$VIRTUALENV/bin/pip install -r requirements.txt

echo "Running the app..."
$VIRTUALENV/bin/python3 app.py
