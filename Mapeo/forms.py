from PIL import Image
from django import forms
from django.contrib.auth.models import User

from Mapeo.models import Bloque, Ruta, Facultad


class RegistroAdminForm(forms.ModelForm):
    password = forms.CharField(
        label='Contraseña',
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                #'placeholder': 'Ingrese la contraseña para la cuenta de administrador',
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
                #'placeholder': 'Ingrese la contraseña nuevamente',
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
            raise forms.ValidationError('Las contraseñas no coinciden')
        return password_confir

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError("Ya existe un administrador registrado con ese nombre de usuario")
        return username

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("Ya existe un administrador registrado con ese correo")


class ModificarAdminForm(forms.ModelForm):
    password = forms.CharField(
        label='Contraseña',
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ingrese la nueva contraseña del administrador',
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

    def clean(self):
        cleaned_data = super().clean()

        numero = self.cleaned_data.get('numero')
        is_auxiliar = self.cleaned_data.get('is_auxiliar')
        if not is_auxiliar and numero is None:
            self.add_error('numero',"Si el bloque no es auxiliar, se requiere ingresar un número.")

        latitud = cleaned_data.get('latitud')
        altitud = cleaned_data.get('altitud')
        if Bloque.objects.filter(latitud=latitud, altitud=altitud).exists():
            self.add_error('latitud', "Ya existe un bloque registrado con esas coordenadas.")

        return cleaned_data


class ModificarBloqueForm(forms.ModelForm):
    class Meta:
        model = Bloque
        fields = '__all__'

    def clean(self):
        cleaned_data = super().clean()

        numero = self.cleaned_data.get('numero')
        is_auxiliar = self.cleaned_data.get('is_auxiliar')
        if not is_auxiliar and numero is None:
            self.add_error('numero',"Si el bloque no es auxiliar, se requiere ingresar un número.")

        bloque_actual = self.instance

        latitud = cleaned_data.get('latitud')
        altitud = cleaned_data.get('altitud')
        if Bloque.objects.filter(latitud=latitud, altitud=altitud).exclude(id=bloque_actual.id).exists():
            self.add_error('latitud', "Ya existe un bloque registrado con esas coordenadas.")

        return cleaned_data


class BloqueRuta(forms.ModelForm):
    class Meta:
        model = Ruta
        fields = '__all__'


class FacultadForm(forms.ModelForm):
    class Meta:
        model = Facultad
        fields = '__all__'

    def clean_nombre(self):
        nombre = self.cleaned_data.get('nombre')
        if Facultad.objects.filter(nombre=nombre).exists():
            raise forms.ValidationError("Ya existe una facultad registrada con ese nombre.")
        return nombre

    def clean_descripcion(self):
        descripcion = self.cleaned_data.get('descripcion')

        if Facultad.objects.filter(descripcion=descripcion):
            raise forms.ValidationError("Ya existe una facultad registrada con esa descripción.")
        return descripcion

    def clean_imagen(self):
        imagen = self.cleaned_data.get('imagen')

        if imagen:
            img = Image.open(imagen)
            ancho, largo = img.size

            ancho_permitido = 600
            largo_permitido = 400

            if ancho > ancho_permitido or largo > largo_permitido:
                raise forms.ValidationError(f"La imágen debe tener un tamaño máximo de {ancho_permitido}x{largo_permitido} píxeles.")
        return imagen


class ModificarFacultadForm(forms.ModelForm):
    class Meta:
        model = Facultad
        fields = '__all__'

    def clean_nombre(self):
        facultad_actual = self.instance

        nombre = self.cleaned_data.get('nombre')

        if Facultad.objects.filter(nombre=nombre).exclude(id=facultad_actual.id).exists():
            raise forms.ValidationError("Ya existe una facultad registrada con ese nombre.")
        return nombre

    def clean_descripcion(self):
        facultad_actual = self.instance

        descripcion = self.cleaned_data.get('descripcion')

        if Facultad.objects.filter(descripcion=descripcion).exclude(id=facultad_actual.id).exists():
            raise forms.ValidationError("Ya existe una facultad registrada con esa descripción.")
        return descripcion

    def clean_imagen(self):
        imagen = self.cleaned_data.get('imagen')

        if imagen:
            img = Image.open(imagen)
            ancho, largo = img.size

            ancho_permitido = 600
            largo_permitido = 400

            if ancho > ancho_permitido or largo > largo_permitido:
                raise forms.ValidationError(
                    f"La imágen debe tener un tamaño máximo de {ancho_permitido}x{largo_permitido} píxeles.")
        return imagen
