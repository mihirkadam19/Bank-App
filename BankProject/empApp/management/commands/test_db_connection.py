from django.core.management.base import BaseCommand
from django.db import connections
from django.db.utils import OperationalError

class Command(BaseCommand):
    help = 'Test the database connection'

    def handle(self, *args, **kwargs):
        db_conn = connections['default']
        
        try:
            db_conn.cursor()  # Try to get a cursor to see if it connects
            self.stdout.write(self.style.SUCCESS('Successfully connected to the database!'))
        except OperationalError as e:
            self.stdout.write(self.style.ERROR(f'Failed to connect to the database: {e}'))
