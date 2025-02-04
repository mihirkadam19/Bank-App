# Generated by Django 5.1.3 on 2024-11-06 15:37

import django.contrib.auth.models
import django.contrib.auth.validators
import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('accno', models.AutoField(db_column='AccNo', primary_key=True, serialize=False)),
                ('balance', models.DecimalField(blank=True, db_column='Balance', decimal_places=2, max_digits=15, null=True)),
                ('type', models.CharField(blank=True, choices=[('Savings', 'Savings'), ('Checking', 'Checking'), ('Money Market', 'Money Market'), ('Loan', 'Loan')], db_column='Type', max_length=12, null=True)),
                ('recentaccess', models.DateField(blank=True, db_column='RecentAccess', null=True)),
                ('interestsrate', models.DecimalField(blank=True, db_column='InterestsRate', decimal_places=2, max_digits=5, null=True)),
                ('overdraft', models.DecimalField(blank=True, db_column='OverDraft', decimal_places=2, max_digits=15, null=True)),
            ],
            options={
                'db_table': 'account',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AccOwner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'acc_owner',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Branch',
            fields=[
                ('bid', models.IntegerField(db_column='BID', primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, db_column='Name', max_length=100, null=True)),
                ('assets', models.DecimalField(blank=True, db_column='Assets', decimal_places=2, max_digits=15, null=True)),
                ('city', models.CharField(blank=True, db_column='City', max_length=100, null=True)),
                ('address', models.CharField(blank=True, db_column='Address', max_length=255, null=True)),
            ],
            options={
                'db_table': 'branch',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('customerid', models.AutoField(db_column='CustomerID', primary_key=True, serialize=False)),
                ('cssn', models.IntegerField(db_column='CSSN', unique=True)),
                ('name', models.CharField(blank=True, db_column='Name', max_length=100, null=True)),
                ('city', models.CharField(blank=True, db_column='City', max_length=100, null=True)),
                ('state', models.CharField(blank=True, db_column='State', max_length=100, null=True)),
                ('zipcode', models.CharField(blank=True, db_column='Zipcode', max_length=10, null=True)),
                ('streetno', models.CharField(blank=True, db_column='StreetNo', max_length=10, null=True)),
                ('aptno', models.CharField(blank=True, db_column='AptNo', max_length=10, null=True)),
            ],
            options={
                'db_table': 'customer',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('empid', models.AutoField(db_column='EmpID', primary_key=True, serialize=False)),
                ('ssn', models.IntegerField(db_column='SSN', unique=True)),
                ('name', models.CharField(blank=True, db_column='Name', max_length=100, null=True)),
                ('startdate', models.DateField(blank=True, db_column='StartDate', null=True)),
                ('teleno', models.CharField(blank=True, db_column='TeleNo', max_length=15, null=True)),
                ('dependentname', models.CharField(blank=True, db_column='DependentName', max_length=100, null=True)),
            ],
            options={
                'db_table': 'employee',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Loans',
            fields=[
                ('amount', models.DecimalField(blank=True, db_column='Amount', decimal_places=2, max_digits=15, null=True)),
                ('loanno', models.IntegerField(db_column='LoanNo', primary_key=True, serialize=False)),
                ('monthlyrepayment', models.DecimalField(blank=True, db_column='MonthlyRepayment', decimal_places=2, max_digits=15, null=True)),
            ],
            options={
                'db_table': 'loans',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Transaction',
            fields=[
                ('tid', models.AutoField(db_column='TID', primary_key=True, serialize=False)),
                ('cssn', models.IntegerField(db_column='CSSN')),
                ('accno', models.IntegerField(db_column='AccNo')),
                ('code', models.CharField(blank=True, db_column='Code', max_length=2, null=True)),
                ('date', models.DateField(blank=True, db_column='Date', null=True)),
                ('time', models.TimeField(blank=True, db_column='Time', null=True)),
                ('amount', models.DecimalField(blank=True, db_column='Amount', decimal_places=2, max_digits=15, null=True)),
                ('charge', models.DecimalField(blank=True, db_column='Charge', decimal_places=2, max_digits=15, null=True)),
            ],
            options={
                'db_table': 'transaction',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AssistantMgr',
            fields=[
                ('bid', models.OneToOneField(db_column='BID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='empApp.branch')),
            ],
            options={
                'db_table': 'assistant_mgr',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Manager',
            fields=[
                ('bid', models.OneToOneField(db_column='BID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='empApp.branch')),
            ],
            options={
                'db_table': 'manager',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PersonalBanker',
            fields=[
                ('cssn', models.OneToOneField(db_column='CSSN', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='empApp.customer')),
            ],
            options={
                'db_table': 'personal_banker',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('user_type', models.CharField(choices=[('manager', 'Manager'), ('assistanMgr', 'AssistanMgr'), ('employee', 'Employee'), ('customer', 'Customer')], max_length=20)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to.', related_name='customuser_set', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='customuser_permissions_set', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
    ]
