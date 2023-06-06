from django.db import models

# Create your models here.
class Libro(models.Model):
    titolo=models.CharField(max_length=50)
    autore=models.CharField(max_length=30)
    categoria=models.CharField(max_length=30)
    nPagina=models.IntegerField()
    nCopieMax=models.IntegerField(null=True)
    nCopieRitirate=models.IntegerField(null=True)


class Prestiti(models.Model):
    idUtente=models.IntegerField()
    libro=models.CharField(max_length=50)
    nCopiePrestate=models.IntegerField()
    dataRitiro=models.DateField(null=True)
    dataConsegna=models.DateField(null=True)
