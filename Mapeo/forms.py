from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.models import User

from Mapeo.models import Bloque, Ruta


class RegistroAdminForm(forms.ModelForm):
    password = forms.CharField(
        label='Contraseña',
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ingrese su contraseña',
                'id': 'password',
                'required': 'required',
            }
        )
    )
    password_confir = forms.CharField(
        label='Contraseña de confirmación',
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ingrese nuevamente su contraseña',
                'id': 'password_confir',
                'required': 'required',
            }
        )
    )

    class Meta:
        model = User
        fields = ('username', 'email', 'password', 'password_confir', 'first_name', 'last_name')

    def clean_password_confir(self):
        password = self.cleaned_data.get('password')
        password_confir = self.cleaned_data.get('password_confir')
        if password and password_confir and password != password_confir:
            raise forms.ValidationError('las contraseñas no coinciden')
        return password_confir


class ModificarAdminForm(forms.ModelForm):
    password = forms.CharField(
        label='Contraseña',
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ingrese su nueva contraseña',
                'id': 'password',
                'required': 'required',
            }
        ),
        required=False
    )

    password_confir = forms.CharField(
        label='Contraseña de confirmación',
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ingrese nuevamente su contraseña',
                'id': 'password_confir',
                'required': 'required',
            }
        ),
        required=False
    )

    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name',)

    def clean_password_confir(self):
        password = self.cleaned_data.get('password')
        password_confir = self.cleaned_data.get('password_confir')
        if password and password_confir and password != password_confir:
            raise forms.ValidationError('Las contraseñas no coinciden')
        return password_confir


class BloqueForm(forms.ModelForm):
    class Meta:
        model = Bloque
        fields = '__all__'


class BloqueRuta(forms.ModelForm):
    class Meta:
        model = Ruta
        fields = '__all__'
